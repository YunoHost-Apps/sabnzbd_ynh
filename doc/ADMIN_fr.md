# Administration de SABnzbd

## Configuration

SABnzbd se configure via son interface web accessible à `https://votredomaine.tld/sabnzbd`.

## Répertoire de données

- Fichiers de configuration : `/home/yunohost.app/sabnzbd/`
- Téléchargements : `/home/yunohost.app/sabnzbd/complete/`
- Téléchargements incomplets : `/home/yunohost.app/sabnzbd/incomplete/`

## Journaux

Les journaux de l'application sont disponibles dans `/var/log/sabnzbd/sabnzbd.log`

## Gestion du service

Le service SABnzbd peut être géré avec les commandes systemd standard :

- Démarrer : `systemctl start sabnzbd`
- Arrêter : `systemctl stop sabnzbd`
- Redémarrer : `systemctl restart sabnzbd`
- État : `systemctl status sabnzbd`
