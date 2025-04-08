#!/bin/bash

set -e  # Corta si algo falla

# ✅ Cargar variables del archivo .env (respetando espacios y comillas)
if [ -f .env ]; then
  echo "🔄 Cargando variables desde .env"
  set -a
  source .env
  set +a
else
  echo "❌ Archivo .env no encontrado"
  exit 1
fi

# ✅ Mostrar variables cargadas para debug
echo "📦 Variables cargadas:"
echo "SMTP_PASSWORD=${SMTP_PASSWORD:0:4}********"
echo "SLACK_WEBHOOK_URL=${SLACK_WEBHOOK_URL:0:30}..."

# ✅ Generar alertmanager.yml desde plantilla
echo "🛠 Generando alertmanager.yml desde plantilla..."
envsubst < alertmanager/alertmanagerNOPSW.yml > alertmanager/alertmanager.yml

# ✅ Confirmar que variables fueron reemplazadas
echo "🧾 Preview de alertmanager.yml:"
grep -E 'smtp_auth_password|api_url' alertmanager/alertmanager.yml

# ✅ Levantar los servicios
echo "🚀 Levantando stack con Docker Compose..."
docker compose up -d

