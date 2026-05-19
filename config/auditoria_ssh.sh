#!/bin/bash
# Analiza accesos SSH del día

LOG="/var/log/auditoria_ssh.log"
AUTH_LOG="/var/log/auth.log"
DATE=$(date +"%Y-%m-%d")

echo "[$DATE] === Auditoría SSH ===" >> $LOG

# Intentos fallidos
FALLOS=$(grep "Failed password" $AUTH_LOG | wc -l)
echo "[$DATE] Intentos fallidos: $FALLOS" >> $LOG

# IPs con más intentos fallidos
echo "[$DATE] IPs con más fallos:" >> $LOG
grep "Failed password" $AUTH_LOG | grep -oP 'from \K[\d.]+' | sort | uniq -c | sort -rn | head -5 >> $LOG

# Accesos válidos
VALIDOS=$(grep "Accepted password" $AUTH_LOG | wc -l)
echo "[$DATE] Accesos aceptados: $VALIDOS" >> $LOG

echo "[$DATE] === Fin auditoría ===" >> $LOG
