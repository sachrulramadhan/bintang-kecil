@echo off
title Auto-Sync GitHub - Bintang Kecil
cd /d "%~dp0"
echo Memulai Auto-Sync ke GitHub...
node scripts/auto-sync.js
pause
