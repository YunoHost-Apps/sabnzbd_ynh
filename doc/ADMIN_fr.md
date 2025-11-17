SABnzbd se configure via son interface web accessible à `https://votredomaine.tld/sabnzbd`.

### Répertoire de données

- Fichiers de configuration : `/home/yunohost.app/sabnzbd/`
- Téléchargements : `/home/yunohost.app/sabnzbd/complete/`
- Téléchargements incomplets : `/home/yunohost.app/sabnzbd/incomplete/`

### Journaux

Les journaux de l'application sont disponibles dans `/var/log/sabnzbd/sabnzbd.log`

### Configuration des sauvegardes

Vous pouvez configurer quels dossiers inclure dans les sauvegardes via le **Panneau de configuration** disponible dans l'interface d'administration YunoHost :
**Applications > SABnzbd > Configuration**

Les dossiers suivants peuvent être inclus ou exclus sélectivement des sauvegardes :

- **Téléchargements terminés** (`complete/`) : Téléchargements terminés. Attention : peut augmenter considérablement la taille des sauvegardes.
- **Téléchargements incomplets** (`incomplete/`) : Téléchargements en cours. Peut augmenter considérablement la taille des sauvegardes.
- **Données administratives** (`admin/`) : Historique et statistiques.

Par défaut, aucun de ces dossiers n'est inclus dans les sauvegardes pour minimiser leur taille. Vous pouvez les activer selon vos besoins.

### Gestion du service

Le service SABnzbd peut être géré avec les commandes systemd standard :

- Démarrer : `systemctl start sabnzbd`
- Arrêter : `systemctl stop sabnzbd`
- Redémarrer : `systemctl restart sabnzbd`
- État : `systemctl status sabnzbd`
