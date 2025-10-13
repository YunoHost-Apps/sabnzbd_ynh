# SABnzbd Administration

## Configuration

SABnzbd is configured through its web interface accessible at `https://yourdomain.tld/sabnzbd`.

## Data Directory

- Configuration files: `/home/yunohost.app/sabnzbd/`
- Downloads: `/home/yunohost.app/sabnzbd/complete/`
- Incomplete downloads: `/home/yunohost.app/sabnzbd/incomplete/`

## Logs

Application logs are available at `/var/log/sabnzbd/sabnzbd.log`

## Service Management

The SABnzbd service can be managed using standard systemd commands:

- Start: `systemctl start sabnzbd`
- Stop: `systemctl stop sabnzbd`
- Restart: `systemctl restart sabnzbd`
- Status: `systemctl status sabnzbd`
