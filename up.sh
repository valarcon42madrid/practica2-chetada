#!/bin/bash

# Establece el trap para borrar el archivo generado al salir del script (por éxito o error)
trap "echo '🧹 Limpiando archivo alertmanager.yml...'; rm -f alertmanager/alertmanager.yml" EXIT

echo "🛠  Generando alertmanager.yml desde plantilla..."
envsubst < alertmanager/alertmanagerNOPSW.yml > alertmanager/alertmanager.yml

echo "🚀 Levantando servicios con Docker Compose..."
docker compose up -d

