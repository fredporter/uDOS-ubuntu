# Systemd Templates

Checked-in `systemd` unit templates for the Ubuntu command centre.

These are starter templates only. Host-installed units should be rendered into
`/etc/systemd/system/` during setup or Sonic-driven install.

The current core set now includes `udos-gitd.service` for the host-owned local
repo store and Git or GitHub execution surface.
