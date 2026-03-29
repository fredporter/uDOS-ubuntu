# Submission: `#binder/ubuntu-v2-3-google-host-mvp` round A

- binder: `#binder/ubuntu-v2-3-google-host-mvp`
- round: `2026-03-24 Google host MVP round A`
- owner: `uDOS-ubuntu`
- status: `in_progress`

## Summary

Ubuntu's default host profile for the first Google MVP round is now explicit:

- `always-on local mirror/cache host`

The repo now states that optional Google-backed lanes must fall back to local
cache and local execution, while leaving provider control to Wizard and remote
service supervision to Empire.

## Evidence

- `@dev/decisions/always-on-server-model.md`
- `@dev/decisions/google-sync-opportunity.md`
- `docs/architecture.md`
- `docs/boundary.md`
- `docs/examples.md`
- `examples/google-mvp-host-profile.json`

## Next Implementation Target

- expose degraded-mode status in operator-facing runtime docs
- connect future Empire mirror jobs to this host profile
- validate with `bash scripts/run-ubuntu-checks.sh`

## Progress Update

Round A now includes:

- `docs/google-mvp-runtime-mode.md`
- `examples/google-mvp-host-profile.json`
