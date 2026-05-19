# Fase 05 — Scripts Bash y Automatización

En esta fase se implementan scripts Bash para automatizar tareas de administración y mantenimiento del servidor.

---

# Objetivos

- Automatizar backups
- Monitorizar servicios críticos
- Auditar accesos SSH
- Automatizar tareas con cron

---

# Organización del proyecto

Los scripts se almacenan dentro del directorio `../config/`.

## Estructura

```
../config/
├── backup.sh
├── monitorizar_sistema.sh
└── auditoria_ssh.sh
```

---

# 1. Backup automático

Script:

```
.../config/backup.sh
```

## Función

- Comprime `/var/www/homelab`
- Guarda backups en `/backups`
- Elimina backups antiguos
- Genera logs automáticos

## Permisos

```
chmod +x config/backup.sh
```

## Cron

```
0 2 * * * /usr/local/bin/backup.sh
```

---

# 2. Monitorización de servicios

Script:

```
config/monitorizar_sistema.sh
```

## Servicios monitorizados

- nginx
- ssh

## Función

- Comprueba servicios críticos
- Intenta reiniciarlos si fallan
- Registra eventos en logs

## Permisos

```bash
chmod +x config/monitorizar_sistema.sh
```

## Cron

```cron
*/5 * * * * /usr/local/bin/monitorizar_sistema.sh
```

---

# 3. Auditoría SSH

Script:

```text
config/auditoria_ssh.sh
```

## Función

- Analiza intentos fallidos SSH
- Detecta IPs sospechosas
- Registra accesos válidos

## Permisos

```bash
chmod +x config/auditoria_ssh.sh
```

## Cron

```cron
0 8 * * * /usr/local/bin/auditoria_ssh.sh
```

---

# 4. Logs generados

```text
/var/log/backup.log
/var/log/monitor_sistema.log
/var/log/auditoria_ssh.log
```

---

# 5. Resultado Final

Con esta fase el servidor tiene:

- backups automáticos
- monitorización de servicios
- recuperación automática básica
- auditoría SSH
- automatización con cron