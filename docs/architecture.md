# uDOS-ubuntu Architecture

uDOS-ubuntu is a reproducible image-definition repo, not a distro fork.

## Main Areas

- build/: image assembly inputs and scripts
- config/: package, system, user, and service defaults
- proton/: Proton suite integration scripts and options
- theming/: uDOS visual identity assets and mode overlays
- boot/: boot branding surfaces and sonic menu integration stubs
- sonic-hooks/: preinstall, postinstall, and live environment hooks for sonic-screwdriver

## Deployment Path

1. image build is produced from deterministic scripts
2. sonic-screwdriver stages and verifies image payloads
3. sonic install mode applies optional injected configuration
4. first-run bootstrap enables uDOS runtime layering

## Boundary Rule

uDOS-ubuntu owns base OS composition and compatibility hooks. It does not own
runtime contracts, provider control surfaces, or cross-repo semantic policy.
