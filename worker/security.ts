import type { D1Database, Env, AuthenticatedUser } from "./types";

const SESSION_COOKIE = "bk_cms_session";
const SESSION_TTL_SECONDS = 60 * 60 * 8;
const PBKDF2_ITERATIONS = 210_000;

export function jsonResponse(
  data: unknown,
  status = 200,
  headers: HeadersInit = {},
): Response {
  return new Response(JSON.stringify(data), {
    status,
    headers: {
      "Content-Type": "application/json; charset=utf-8",
      "Cache-Control": "no-store",
      "X-Content-Type-Options": "nosniff",
      ...headers,
    },
  });
}

export async function readJson(request: Request): Promise<Record<string, unknown>> {
  try {
    const value: unknown = await request.json();
    if (!value || typeof value !== "object" || Array.isArray(value)) {
      throw new Error("Expected a JSON object.");
    }
    return value as Record<string, unknown>;
  } catch (error) {
    if (error instanceof SyntaxError) {
      throw new HttpError(400, "Permintaan JSON tidak valid.");
    }
    throw error;
  }
}

export class HttpError extends Error {
  constructor(
    public readonly status: number,
    message: string,
  ) {
    super(message);
    this.name = "HttpError";
  }
}

export function requiredString(
  body: Record<string, unknown>,
  field: string,
  maxLength = 500,
): string {
  const value = body[field];
  if (typeof value !== "string" || !value.trim() || value.trim().length > maxLength) {
    throw new HttpError(400, `${field} wajib diisi dan maksimal ${maxLength} karakter.`);
  }
  return value.trim();
}

export function optionalString(
  body: Record<string, unknown>,
  field: string,
  maxLength = 5000,
): string {
  const value = body[field];
  if (value === undefined || value === null) return "";
  if (typeof value !== "string" || value.length > maxLength) {
    throw new HttpError(400, `${field} tidak valid.`);
  }
  return value.trim();
}

export function integerField(
  body: Record<string, unknown>,
  field: string,
  fallback: number,
  minimum: number,
  maximum: number,
): number {
  const value = body[field] === undefined ? fallback : Number(body[field]);
  if (!Number.isInteger(value) || value < minimum || value > maximum) {
    throw new HttpError(400, `${field} harus berupa angka ${minimum}–${maximum}.`);
  }
  return value;
}

export function enumField<T extends string>(
  body: Record<string, unknown>,
  field: string,
  allowed: readonly T[],
  fallback: T,
): T {
  const value = body[field] === undefined ? fallback : body[field];
  if (typeof value !== "string" || !allowed.includes(value as T)) {
    throw new HttpError(400, `${field} tidak valid.`);
  }
  return value as T;
}

export function jsonArrayField(
  body: Record<string, unknown>,
  field: string,
  fallback: unknown[] = [],
): string {
  const value = body[field] === undefined ? fallback : body[field];
  if (!Array.isArray(value) || value.length > 200) {
    throw new HttpError(400, `${field} harus berupa daftar yang valid.`);
  }
  return JSON.stringify(value);
}

export function jsonObjectField(
  body: Record<string, unknown>,
  field: string,
  fallback: Record<string, unknown> = {},
): string {
  const value = body[field] === undefined ? fallback : body[field];
  if (!value || typeof value !== "object" || Array.isArray(value)) {
    throw new HttpError(400, `${field} harus berupa objek yang valid.`);
  }
  return JSON.stringify(value);
}

export function emailField(
  body: Record<string, unknown>,
  field: string,
): string {
  const value = requiredString(body, field, 254).toLowerCase();
  if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value)) {
    throw new HttpError(400, "Format email tidak valid.");
  }
  return value;
}

export function normalizeLogin(value: string): string {
  return value.trim().toLowerCase();
}

export function createId(prefix: string): string {
  return `${prefix}_${crypto.randomUUID()}`;
}

export function randomToken(byteLength = 32): string {
  const bytes = crypto.getRandomValues(new Uint8Array(byteLength));
  return Array.from(bytes, (byte) => byte.toString(16).padStart(2, "0")).join("");
}

export async function sha256(value: string): Promise<string> {
  const digest = await crypto.subtle.digest("SHA-256", new TextEncoder().encode(value));
  return Array.from(new Uint8Array(digest), (byte) => byte.toString(16).padStart(2, "0")).join("");
}

export async function hashPassword(password: string): Promise<string> {
  if (password.length < 12 || password.length > 256) {
    throw new HttpError(400, "Kata sandi harus terdiri dari 12–256 karakter.");
  }
  const salt = crypto.getRandomValues(new Uint8Array(16));
  const key = await crypto.subtle.importKey(
    "raw",
    new TextEncoder().encode(password),
    "PBKDF2",
    false,
    ["deriveBits"],
  );
  const hash = await crypto.subtle.deriveBits(
    { name: "PBKDF2", hash: "SHA-256", salt, iterations: PBKDF2_ITERATIONS },
    key,
    256,
  );
  return `pbkdf2-sha256$${PBKDF2_ITERATIONS}$${toHex(salt)}$${toHex(new Uint8Array(hash))}`;
}

export async function verifyPassword(
  password: string,
  storedHash: string,
): Promise<boolean> {
  const [algorithm, iterationsText, saltHex, expectedHex] = storedHash.split("$");
  const iterations = Number(iterationsText);
  if (
    algorithm !== "pbkdf2-sha256" ||
    !Number.isInteger(iterations) ||
    iterations < 100_000 ||
    iterations > 500_000 ||
    !saltHex ||
    !expectedHex
  ) {
    return false;
  }
  const salt = fromHex(saltHex);
  const key = await crypto.subtle.importKey(
    "raw",
    new TextEncoder().encode(password),
    "PBKDF2",
    false,
    ["deriveBits"],
  );
  const hash = await crypto.subtle.deriveBits(
    { name: "PBKDF2", hash: "SHA-256", salt, iterations },
    key,
    256,
  );
  return constantTimeEqual(toHex(new Uint8Array(hash)), expectedHex);
}

export function constantTimeEqual(left: string, right: string): boolean {
  let difference = left.length ^ right.length;
  const maxLength = Math.max(left.length, right.length);
  for (let index = 0; index < maxLength; index += 1) {
    difference |= (left.charCodeAt(index) || 0) ^ (right.charCodeAt(index) || 0);
  }
  return difference === 0;
}

export function assertSameOrigin(request: Request): void {
  const origin = request.headers.get("Origin");
  if (!origin || origin !== new URL(request.url).origin) {
    throw new HttpError(403, "Permintaan ditolak karena sumbernya tidak cocok.");
  }
}

export function sessionCookie(token: string, maxAge: number): string {
  return `${SESSION_COOKIE}=${token}; HttpOnly; Secure; SameSite=Strict; Path=/api/cms; Max-Age=${maxAge}`;
}

export function expiredSessionCookie(): string {
  return `${SESSION_COOKIE}=; HttpOnly; Secure; SameSite=Strict; Path=/api/cms; Max-Age=0`;
}

function parseCookie(request: Request, key: string): string | null {
  const cookie = request.headers.get("Cookie");
  if (!cookie) return null;
  for (const part of cookie.split(";")) {
    const separator = part.indexOf("=");
    if (separator < 0) continue;
    if (part.slice(0, separator).trim() === key) {
      return decodeURIComponent(part.slice(separator + 1).trim());
    }
  }
  return null;
}

export async function authenticate(
  request: Request,
  env: Env,
): Promise<AuthenticatedUser | null> {
  const token = parseCookie(request, SESSION_COOKIE);
  if (!token) return null;
  const tokenHash = await sha256(token);
  const user = await env.CMS_DB.prepare(
    `SELECT u.id, u.name, u.email, u.username, u.role_id, r.name AS role_name,
            u.status, u.last_login, u.created_at
       FROM sessions s
       JOIN users u ON u.id = s.user_id
       JOIN roles r ON r.id = u.role_id
      WHERE s.token_hash = ? AND s.expires_at > datetime('now') AND u.status = 'active'`,
  )
    .bind(tokenHash)
    .first<Omit<AuthenticatedUser, "permissions">>();
  if (!user) return null;
  const permissions = await env.CMS_DB.prepare(
    `SELECT rp.permission_id AS id
       FROM role_permissions rp
      WHERE rp.role_id = ?`,
  )
    .bind(user.role_id)
    .all<{ id: string }>();
  return { ...user, permissions: permissions.results.map((row) => row.id) };
}

export function requirePermission(
  user: AuthenticatedUser | null,
  permission: string,
): asserts user is AuthenticatedUser {
  if (!user) throw new HttpError(401, "Silakan login untuk melanjutkan.");
  if (!user.permissions.includes(permission)) {
    throw new HttpError(403, "Akun Anda tidak memiliki izin untuk tindakan ini.");
  }
}

export function toHex(bytes: Uint8Array): string {
  return Array.from(bytes, (byte) => byte.toString(16).padStart(2, "0")).join("");
}

function fromHex(value: string): Uint8Array {
  if (!/^(?:[a-f0-9]{2})+$/i.test(value)) return new Uint8Array();
  const bytes = new Uint8Array(value.length / 2);
  for (let index = 0; index < bytes.length; index += 1) {
    bytes[index] = Number.parseInt(value.slice(index * 2, index * 2 + 2), 16);
  }
  return bytes;
}

export async function writeAudit(
  db: D1Database,
  userId: string | null,
  action: string,
  targetType: string,
  targetId: string | null,
  before: unknown,
  after: unknown,
): Promise<void> {
  await db
    .prepare(
      `INSERT INTO audit_logs (id, user_id, action, target_type, target_id, before_json, after_json)
       VALUES (?, ?, ?, ?, ?, ?, ?)`,
    )
    .bind(
      createId("audit"),
      userId,
      action,
      targetType,
      targetId,
      before === null ? null : JSON.stringify(before),
      after === null ? null : JSON.stringify(after),
    )
    .run();
}

export { SESSION_TTL_SECONDS };
