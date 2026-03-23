# Always-On Server Model

uDOS-Ubuntu is the persistent node in the uDOS ecosystem.

## Duties

- run local daemon processes
- expose local APIs where appropriate
- maintain caches and mirrors
- coordinate sync windows
- host Empire services
- provide stable local execution for background tasks

## Cloud relationship

Ubuntu may connect to cloud services, but it should not surrender system truth to them.

The local vault remains authoritative.
