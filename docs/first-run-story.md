# Ubuntu First-Run Story

This is the intended first-run setup story for the current `uDOS-ubuntu` lane.

## Sequence

1. boot into the Ubuntu base image staged by Sonic
2. apply `sonic-hooks/preinstall.sh`, `postinstall.sh`, and `live-env.sh`
3. verify package baseline from `config/packages.list`
4. hand off to `uDOS-shell` quickstart and startup health summary
5. optionally launch the ThinUI C64 first-run panel

## Demo Entry

```bash
bash scripts/demo-first-run-setup.sh
```

## ThinUI Payload

- `examples/thinui-c64-launch.json`
