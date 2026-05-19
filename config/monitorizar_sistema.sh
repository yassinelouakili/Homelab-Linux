#!/bin/bash
# Comprueba que nginx y ssh están activos

LOG="/var/log/monitor_sistema.log"
DATE=$(date +"%Y-%m-%d %H:%M:%S")

# Comprobar nginx
systemctl is-active --quiet nginx

if [ $? -eq 0 ]; then
    echo "[$DATE] nginx está activo." >> $LOG
else
    echo "[$DATE] nginx está caído. Intentando reiniciar..." >> $LOG
    systemctl restart nginx
    echo "[$DATE] nginx reiniciado." >> $LOG
fi

# Comprobar ssh
systemctl is-active --quiet ssh

if [ $? -eq 0 ]; then
    echo "[$DATE] ssh está activo." >> $LOG
else
    echo "[$DATE] ssh está caído. Intentando reiniciar..." >> $LOG
    systemctl restart ssh
    echo "[$DATE] ssh reiniciado." >> $LOG
fi
