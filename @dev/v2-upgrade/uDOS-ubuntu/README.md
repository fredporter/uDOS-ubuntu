# uDOS-ubuntu Google MVP Round

This folder is the repo-local execution home for the Ubuntu side of the first
Google MVP round.

Use it for:

- host and fallback notes
- cache and local execution assumptions
- repo-owned implementation decisions for the Google MVP lane
- operator-visible degraded-mode and recovery rules

Family coordination stays in `uDOS-dev/@dev`. Ubuntu remains the host and
fallback lane, not the owner of provider orchestration or remote-service
semantics.

Current named host profile for the first day-round:

- `always-on local mirror/cache host`
