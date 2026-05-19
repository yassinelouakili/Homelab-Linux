#!/bin/bash
# Backup automático de /var/www/homelab

DATE=$(date +"%Y%m%d")
ORIGEN="/var/www/homelab"
DESTINO="/backups"
ARCHIVO="$DESTINO/backup_$DATE.tar.gz"
LOG="/var/log/backup.log"

echo "[$DATE] Iniciando backup..." >> $LOG

tar -czf $ARCHIVO $ORIGEN

echo "[$DATE] Backup guardado en $ARCHIVO" >> $LOG

# Eliminar backups de más de 7 días
find $DESTINO -name "backup_*.tar.gz" -mtime +7 -delete

echo "[$DATE] Backups antiguos eliminados." >> $LOG
