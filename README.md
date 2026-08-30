# Ray-Ban Meta Visual Tutor

Build a hands-free assistant for Ray-Ban Meta Wayfarer Gen 2 glasses:

> Look at something, ask a question, and hear a short useful answer through the glasses.

The project will later support memory capture and field checklists, but the first completion target is the visual-tutor loop.

## Current status

**Milestone 1 — Prerequisite audit: IN PROGRESS**

Current blockers:

- Increase iPhone free storage from `3.85 GB` to at least `5 GB`.
- Install the Apple Windows components required by Sideloadly; they are not currently detected.
- Create the project repository and choose public or private visibility.

We will not attempt a cloud build until this audit passes.

## Confirmed from the supplied screenshots

- Ray-Ban Meta Wayfarer glasses are connected in Meta AI.
- Meta AI Developer Mode is enabled.
- Meta AI app version is `287.0.0.11.156`.
- The on-glasses DAT component is `0.9.0.26.0`.
- Glasses release version is `127.14.0.220.436`.
- Test phone is an iPhone 14 running iOS `26.5`.
- Sideloadly v0.60 is installed and running on Windows.
- GitHub CLI is securely authenticated as `prathameshparit` using the Windows credential keyring.

Serial numbers are intentionally not copied into this repository.

## Delivery strategy

We are using a zero-membership development path:

```text
Windows source code
  -> GitHub Actions macOS runner builds an unsigned IPA
  -> Sideloadly signs it with a free Apple ID
  -> physical iPhone runs the app
  -> Meta DAT connects to the physical glasses
```

Free Apple signing expires after seven days, so the app must be refreshed. This is acceptable for development but not public distribution.

## MVP definition of done

The MVP is complete only when a recorded physical-device test proves all of the following:

1. The app launches on the user's iPhone after the free sideload process.
2. It registers through Meta AI Developer Mode.
3. It receives live frames from the glasses camera.
4. The user asks a question without touching the phone after activation.
5. The selected image/frame and question reach the chosen vision model.
6. A short answer plays through the glasses.
7. Camera, session, permission, and audio failures produce actionable errors.
8. The seven-day refresh procedure is documented and tested once.

## Working documents

- [Roadmap](docs/ROADMAP.md)
- [Prerequisites](docs/PREREQUISITES.md)
- [Architecture](docs/ARCHITECTURE.md)
- [Decisions](docs/DECISIONS.md)
- [Test log](docs/TEST_LOG.md)
- [Source index](docs/SOURCES.md)
