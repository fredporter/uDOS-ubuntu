# uDOS-ubuntu Architecture

uDOS-ubuntu is a reproducible image-definition and browser-workstation host
repo, not a distro fork.

## Main Areas

- build/: image assembly inputs and scripts
- config/: package, system, user, and service defaults
- proton/: Proton suite integration scripts and options
- theming/: uDOS visual identity assets and mode overlays
- boot/: boot branding surfaces and sonic menu integration stubs
- sonic-hooks/: preinstall, postinstall, and live environment hooks for sonic-screwdriver
- examples/: first-run and browser-workstation scaffold payloads

## Deployment Path

1. image build is produced from deterministic scripts
2. sonic-screwdriver stages and verifies image payloads
3. sonic install mode applies optional injected configuration
4. first-run bootstrap enables uDOS runtime layering
5. browser workstation opens the binder-native local operator shell

## Boundary Rule

uDOS-ubuntu owns base OS composition, workstation hosting, and compatibility
hooks. It does not own runtime contracts, provider control surfaces, or
cross-repo semantic policy.

## Google MVP Host Rule

For the first Google MVP lane, Ubuntu's default posture is:

- `always-on local mirror/cache host`

That means Ubuntu owns:

- local cache
- artifact staging
- degraded-mode recovery
- operator-visible host behavior when remote services are offline

Ubuntu does not own:

- provider entry
- remote-service supervision
- canonical cloud semantics
