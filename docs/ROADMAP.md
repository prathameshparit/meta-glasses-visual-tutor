# Roadmap and test gates

The order is deliberate. Each milestone isolates one class of failure. We stop at every gate, record evidence, and only then continue.

## Milestone 0 — Project handbook

**Status:** DONE

Deliverables:

- Source-of-truth README.
- Prerequisite checklist.
- Architecture and decision records.
- Test log and source index.

Gate: all documents exist and agree on the next milestone.

## Milestone 1 — Prerequisite audit

**Status:** DONE

Actions:

1. Record iPhone model, iOS version, and available storage.
2. Verify Git and GitHub access on Windows.
3. Install/verify Sideloadly plus required Apple Windows components.
4. Confirm USB trust and device visibility.
5. Choose public or private GitHub repository.

Gate:

- Every required prerequisite has a pass/fail result.
- No account secret has been placed in the repository.

## Milestone 2 — Cloud-build proof

**Status:** DONE

Goal: prove that Windows edits can produce a downloadable unsigned iPhone IPA without a Mac or paid Apple membership.

Actions:

1. Create a minimal SwiftUI app with a visible build identifier.
2. Add a GitHub Actions macOS workflow.
3. Compile with code signing disabled.
4. Package and upload an unsigned IPA artifact.

Gate:

- GitHub Actions is green.
- The artifact contains a valid `.app` bundle inside `Payload/`.
- The app version/build identifier matches the commit that produced it.

## Milestone 3 — Free sideload proof

**Status:** IN PROGRESS

Goal: install and launch our own build on the physical iPhone.

Actions:

1. Download the unsigned IPA on Windows.
2. Sign and install it with Sideloadly and the free Apple Account.
3. Enable iPhone Developer Mode if requested.
4. Trust the developer profile.
5. Relaunch after disconnecting USB.

Gate:

- App launches on the physical iPhone.
- Displayed build identifier matches the GitHub artifact.
- Reinstalling the same bundle preserves expected app data.
- Expiry/refresh date is recorded.

## Milestone 4 — Official Meta registration proof

**Status:** BLOCKED BY MILESTONE 3

Goal: validate Meta DAT independently of our AI code.

Actions:

1. Base the build on Meta's official DAT `0.9.x` CameraAccess sample or a minimal faithful extraction.
2. Configure Developer Mode registration using `MetaAppID = 0`.
3. Register through the Meta AI callback flow.
4. Request camera permission.
5. Surface session/device state and typed errors on screen.

Gate:

- Registration returns to our app successfully.
- The linked glasses appear as an eligible device.
- Camera permission reports `granted`.
- Closing and reopening the app has understood, documented behavior.

## Milestone 5 — Physical camera stream

**Status:** BLOCKED BY MILESTONE 4

Goal: show current glasses frames on the iPhone.

Actions:

1. Start a device session.
2. Attach the camera with a conservative stream configuration.
3. Display frames and frame timestamps.
4. Stop/clean up on fold, doff, disconnect, background, and user stop.
5. Capture one still through the DAT stream path.

Initial configuration: medium or low resolution at 7 FPS. Increase only after reliability is proven.

Gate:

- Live preview visibly follows the glasses view.
- Ten-minute stream test completes without a crash.
- Stop/start works three consecutive times.
- Folding the glasses releases the session cleanly.
- One captured image is inspectable in-app.

## Milestone 6 — Activation experiment

**Status:** BLOCKED BY MILESTONE 5

Goal: find the most natural supported hands-free trigger.

Test separately:

1. Physical capture-button tap event.
2. Physical capture-button hold event.
3. App wake phrase.
4. Large phone button as a diagnostic fallback.

Gate:

- At least one hands-free activation works reliably in 10/10 attempts.
- Capture-button support is recorded as proven or unavailable; it is never assumed.

## Milestone 7 — Audio routing

**Status:** BLOCKED BY MILESTONE 5

Goal: independently prove output and input routes.

Tests:

1. Play a fixed spoken phrase through the glasses.
2. Record a short question using the glasses microphone while camera streaming is stopped.
3. Test microphone input while camera streaming is active.
4. If simultaneous glasses-mic plus camera is unreliable, use the iPhone mic during streaming or use a capture-then-listen sequence.

Gate:

- Output through glasses passes 10/10 attempts.
- A chosen input strategy passes 10/10 attempts.
- The camera/microphone coexistence result is documented on our exact hardware/firmware.

## Milestone 8 — Single-frame visual question

**Status:** BLOCKED BY MILESTONES 5 AND 7

Goal: answer one typed question about one glasses frame.

Actions:

1. Keep only the latest usable frame in memory.
2. Send the frame plus typed question to a pluggable vision backend.
3. Display the concise answer.
4. Add timeout, cancellation, and redacted logging.

Gate:

- Five varied objects/diagrams receive relevant answers.
- No image is persisted unless the user requests it.
- Timeout and network failure are understandable.

## Milestone 9 — Spoken visual tutor MVP

**Status:** BLOCKED BY MILESTONE 8

Goal: complete the end-to-end voice loop.

Flow:

```text
activate -> acquire view -> capture question -> vision inference -> concise TTS answer
```

Gate:

- Ten consecutive end-to-end questions complete without touching the phone after activation.
- Median response time and failures are recorded.
- Answers play through the glasses.

This is the first MVP completion point.

## Milestone 10 — Continuous tutor mode

Goal: keep a session open for follow-up questions against the latest frame while controlling battery, heat, and data use.

Gate: a 20-minute session completes with recorded battery/thermal observations and clean teardown.

## Milestone 11 — Memory assistant

Add explicit “remember this” capture with image, note, time, and optional location. Add retrieval only after capture/storage tests pass.

## Milestone 12 — Field checklist

Add one checklist format, voice next/back/repeat, and explicit proof-photo checkpoints. Do not combine this with memory work in the same milestone.

## Milestone 13 — Reliability and privacy hardening

Cover permissions, disconnects, backgrounding, data deletion, retention settings, redacted logs, rate limits, and bystander-aware UX.

## Milestone 14 — Seven-day maintenance rehearsal

Refresh/re-sign the app before expiry and verify that settings and local data survive. Document the exact recurring procedure.
