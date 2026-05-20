# Homelab Linux

Servidor Linux administrado desde cero como proyecto personal de aprendizaje práctico.

## Descripción

Despliegue y administración completa de una infraestructura virtualizada con Ubuntu Server 24.04, implementando servicios reales de red, seguridad, monitorización y automatización mediante scripts Bash.
El proyecto cubre desde la instalación base hasta un entorno funcional con múltiples servicios operativos.


## Stack tecnológico

- **OS:** 2x Ubuntu Server 24.04 LTS - Ubuntu Desktop 24.04 LTS
- **Virtualización:** VirtualBox (red NAT interna, tres VMs)
- **Web:** Nginx
- **DNS:** Pi-hole
- **Monitorización:** Netdata
- **Automatización:** Bash + Cron

## Fases del proyecto

| Fase | Contenido | Estado |
|------|-----------|--------|
| 1 | Instalación, IP estática, hardening SSH, UFW | ✅ |
| 2 | Servidor web Nginx con virtualhost propio | ✅ |
| 3 | DNS local con Pi-hole en VM independiente | ✅ |
| 4 | Monitorización con Netdata y alertas de disco | ✅ |
| 5 | Scripts de automatización Bash (backup, monitorización, auditoría SSH) | ✅ |

## Qué se implementó

**Fase 1 — Base del servidor**
Instalación de Ubuntu Server, configuración de IP estática con Netplan, hardening SSH (acceso por clave pública, login root deshabilitado) y firewall UFW con reglas mínimas.

**Fase 2 — Servidor web**
Instalación y configuración de Nginx con virtualhost propio, sirviendo contenido estático desde `/var/www/homelab`.

**Fase 3 — DNS local**
Segunda VM dedicada (`192.168.100.101`) con Pi-hole como servidor DNS con bloqueo de publicidad.
El servidor principal usa esta VM como DNS resolver.

**Fase 4 — Monitorización**
Netdata instalado en el servidor principal, accesible en el puerto 19999, con alerta personalizada de uso de disco configurada vía fichero de health checks.

**Fase 5 — Automatización**
Tres scripts Bash programados con cron: backup automático de `/var/www/homelab`, monitorización y auto-reinicio de servicios críticos (Nginx, SSH), y auditoría de intentos de acceso SSH fallidos.
Todos generan logs en `/var/log/`.


## Estructura del repositorio

- `/docs` — Documentación detallada de cada fase
- `/config` — Ficheros de configuración utilizados y Scripts Bash de administración y automatización
- `/capturas` — Evidencias visuales del laboratorio funcionando

## Autor

**Yassine Elouakili**  
Técnico Superior en Administración de Sistemas en Red - En Formación  
[LinkedIn](https://www.linkedin.com/in/yassine-e-033b56342/) · [GitHub](https://github.com/yassinelouakili)


