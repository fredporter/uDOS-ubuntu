# uDOS-ubuntu Activation

## Purpose

Activate the first public base-image lane for the uDOS family with deterministic
build surfaces and sonic-compatible install hooks.

## Activated Surfaces

- reproducible build lane under build/
- package and system defaults under config/
- sonic pre/post install hooks under sonic-hooks/
- repo validation entrypoint under scripts/run-ubuntu-checks.sh

## Current Validation Contract

Run:

scripts/run-ubuntu-checks.sh

The command verifies required repository surfaces and key bootstrap templates.
