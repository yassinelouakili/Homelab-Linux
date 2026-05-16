# Fase 1 — Base del servidor

**Objetivo:** Instalación del sistema operativo, y configuración de IP estática, hardening SSH, UFW.
 
**Instalación**
- Durante el instalador, selecciona instalar OpenSSH Server cuando te lo ofrezca
- Crea un usuario no-root, `yassine`
- Deja el particionado por defecto

**IP estática**
Ubuntu Server 24.04 usa Netplan. Edito el fichero de configuración:

```bash
sudo nano /etc/netplan/50-cloud-init.yaml
```
```yaml
network:
  version: 2
  ethernets:
    enp0s3:
      dhcp4: false
      addresses: [192.168.100.100/24]
      gateway4: 192.168.100.1
      nameservers:
        addresses: [8.8.8.8, 1.1.1.1]
```
```
sudo netplan apply
```

**Hardening básico**
```
# Actualizar el sistema
sudo apt update && sudo apt upgrade -y

# Firewalls: permitir solo SSH y HTTP/HTTPS
sudo ufw allow OpenSSH
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable

# Deshabilitar login SSH como root
sudo nano /etc/ssh/sshd_config
# Cambia: PermitRootLogin yes → PermitRootLogin no
sudo systemctl restart ssh
```

**Acceso SSH con clave pública (UbuntuDesktop)**
```
# En el Des (no en la VM), genera el par de claves
ssh-keygen -t ed25519 -C "homelab"

# Copia la clave pública a la VM
ssh-copy-id yassine@192.168.100.100

# A partir de ahora entras sin contraseña
ssh yassine@192.168.100.100
```

**Checkpoint**
- Entras por SSH sin contraseña
- `ufw status` muestra las reglas activas
- El servidor tiene IP fija y responde al ping
