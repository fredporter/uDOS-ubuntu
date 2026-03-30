# Ubuntu First-Run Story

This is the intended first-run setup story for the current `uDOS-ubuntu` lane.

## Sequence

1. boot into the Ubuntu base image staged by Sonic
2. apply `sonic-hooks/preinstall.sh`, `postinstall.sh`, and `live-env.sh`
3. verify package baseline from `config/packages.list`
4. verify the local runtime home and repo-store roots under `~/.udos/`
5. open the browser command-centre home scaffold as the operator shell
6. hand off to `uDOS-shell` quickstart and startup health summary
7. optionally launch the ThinUI C64 first-run panel

Optional repo-store bootstrap after first run:

```bash
bash scripts/udos-gitd.sh init-layout
bash scripts/udos-gitd.sh repo-list
```

## Demo Entry

```bash
bash scripts/demo-first-run-setup.sh
```

Browser command-centre demo entry:

```bash
bash scripts/demo-browser-workstation.sh
```

## ThinUI Payload

- `examples/thinui-c64-launch.json`

## Browser Command-Centre Payload

- `examples/browser-workstation-scaffold.json`
