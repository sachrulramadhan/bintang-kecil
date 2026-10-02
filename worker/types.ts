export type D1Value = string | number | null | ArrayBuffer;

export interface D1Result<T> {
  success: boolean;
  results: T[];
  meta: {
    changes: number;
    last_row_id: number;
  };
}

export interface D1PreparedStatement {
  bind(...values: D1Value[]): D1PreparedStatement;
  first<T>(columnName?: string): Promise<T | null>;
  all<T>(): Promise<D1Result<T>>;
  run<T = unknown>(): Promise<D1Result<T>>;
}

export interface D1Database {
  prepare(query: string): D1PreparedStatement;
}

export interface StaticAssets {
  fetch(request: Request): Promise<Response>;
}

export interface Env {
  CMS_DB: D1Database;
  ASSETS: StaticAssets;
  CMS_SETUP_TOKEN?: string;
}

export interface CmsUser {
  id: string;
  name: string;
  email: string;
  username: string;
  role_id: string;
  role_name: string;
  status: "active" | "pending" | "suspended";
  last_login: string | null;
  created_at: string;
}

export interface AuthenticatedUser extends CmsUser {
  permissions: string[];
}
