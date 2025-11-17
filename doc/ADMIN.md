SABnzbd is configured through its web interface accessible at `https://yourdomain.tld/sabnzbd`.

### Data Directory

- Configuration files: `/home/yunohost.app/sabnzbd/`
- Downloads: `/home/yunohost.app/sabnzbd/complete/`
- Incomplete downloads: `/home/yunohost.app/sabnzbd/incomplete/`

### Logs

Application logs are available at `/var/log/sabnzbd/sabnzbd.log`

### Backup Configuration

You can configure which folders to include in backups through the **Config Panel** available in the YunoHost web admin:
**Applications > SABnzbd > Configuration**

The following folders can be selectively included or excluded from backups:

- **Completed downloads** (`complete/`): Finished downloads. Warning: can significantly increase backup size.
- **Incomplete downloads** (`incomplete/`): Downloads in progress. Can significantly increase backup size.
- **Admin data** (`admin/`): History and statistics.

By default, none of these folders are included in backups to minimize backup size. You can enable any of them according to your needs.

### Service Management

The SABnzbd service can be managed using standard systemd commands:

- Start: `systemctl start sabnzbd`
- Stop: `systemctl stop sabnzbd`
- Restart: `systemctl restart sabnzbd`
- Status: `systemctl status sabnzbd`
