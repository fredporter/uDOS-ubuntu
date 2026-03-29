# uDOS-ubuntu Architecture

uDOS-ubuntu is the reproducible Ubuntu image-definition and always-on runtime
host repo for the family command centre. It is still not a distro fork.

## Main Areas

- build/: image assembly inputs and scripts
- config/: package, system, user, and service defaults
- proton/: Proton suite integration scripts and options
- theming/: uDOS visual identity assets and mode overlays
- boot/: boot branding surfaces and sonic menu integration stubs
- sonic-hooks/: preinstall, postinstall, and live environment hooks for sonic-screwdriver
- examples/: first-run and command-centre scaffold payloads

## Runtime Host Direction

Ubuntu is the intended host for:

- the base browser command centre
- the base TUI shell and command loop
- local/offline/online runtime networking
- Beacon and Portal service hosting
- master local vault storage and static vault publishing
- sync queues and retry workers
- scheduled operations and background jobs
- data-to-markdown processing services
- runtime-edge API budgeting enforcement

## Deployment Path

1. image build is produced from deterministic scripts
2. sonic-screwdriver stages and verifies image payloads
3. sonic install mode applies optional injected configuration
4. first-run bootstrap enables the always-on runtime layer
5. browser command centre and TUI shell open as the operator entry surfaces

## Boundary Rule

uDOS-ubuntu owns base OS composition, command-centre hosting, and runtime host
assembly. It does not own canonical runtime contracts, provider adapter logic,
or cross-repo semantic policy.

`uDOS-core` remains the canonical contract owner.
`uDOS-wizard` should contract toward publishing, provider bridges, assist, MCP,
and remote adapters.
`uHOME` should consume the runtime spine rather than redefine it.

## Failure Rule

If Wizard is offline, Ubuntu-hosted local runtime surfaces must still support:

- local shell command execution
- local browser command-centre access
- local vault serving and browsing
- local scheduling
- local sync persistence and retry

Remote publishing and provider-backed assist may degrade, but the base runtime
must continue operating.
