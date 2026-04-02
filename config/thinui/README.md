# ThinUI Defaults

ThinUI launch and focused panel defaults for Ubuntu-hosted local views.

## Surface profiles (uDOS-surface)

Host and launcher JSON can reference an **experience profile** from **`uDOS-surface/profiles/`** so ThinUI starts with the correct **mode**, **theme id**, and **`state.surface`** metadata (see `uDOS-surface/docs/surface-experience-layer.md`).

- Example launch scaffold: **`examples/thinui-ubuntu-gnome-launch.json`** (Classic Modern / `udos-default`, windowed-friendly).
- ThinUI CLI: `npm run demo -- --profile ubuntu-gnome` or `--surface-profile-file /path/to/uDOS-surface/profiles/ubuntu-gnome/surface.json` (sibling checkout).
- Optional env for future host scripts: **`UDOS_SURFACE_REPO`** — absolute path to `uDOS-surface` when not adjacent to `uDOS-thinui`.

Validation (family checkout): `python3 uDOS-surface/scripts/validate_surface_profiles.py`.
