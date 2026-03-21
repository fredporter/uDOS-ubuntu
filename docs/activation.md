# uDOS-ubuntu Activation

## Purpose

Activate the first public base-image lane for the uDOS family with deterministic
build surfaces, sonic-compatible install hooks, and a browser-workstation setup
direction aligned to the public `mdc-mac-app` role.

## Activated Surfaces

- reproducible build lane under build/
- package and system defaults under config/
- sonic pre/post install hooks under sonic-hooks/
- browser-workstation scaffold under examples/ and docs/
- repo validation entrypoint under scripts/run-ubuntu-checks.sh

## Current Validation Contract

Run:

scripts/run-ubuntu-checks.sh

The command verifies required repository surfaces and key bootstrap templates.
