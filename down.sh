#!/bin/bash
set -e

echo "🧹  Deteniendo y eliminando contenedores, volúmenes y redes..."
docker compose down -v

echo "🗑️  Borrando archivo alertmanager.yml..."
rm -f alertmanager/alertmanager.yml

echo "🗑️  Borrando contenido de grafana-storage/..."
rm -rf grafana-storage/*

echo "✅  Entorno limpio. Listo para un nuevo 'up.sh'"

