# Architecture

## Development and installation

```text
Windows workspace
    |
    | git push
    v
GitHub repository
    |
    | GitHub Actions on macOS/Xcode
    v
Unsigned IPA artifact
    |
    | Sideloadly + free Apple Account
    v
Physical iPhone
```

CI performs compilation only. Apple credentials remain local to the sideload tool and are never stored in GitHub.

## Runtime MVP

```text
Ray-Ban Meta Gen 2
  camera frames --------------------+
  open-ear audio <---------------+  |
                                   |  v
                              iPhone bridge/app
                               |   |       |
                    activation |   |       | TTS/audio route
                    + question |   |       |
                               v   v       |
                         Orchestrator      |
                               |           |
                               v           |
                         Vision backend ---+
```

The iPhone is required because Meta DAT is a native iOS/Android SDK. The laptop may later host the vision backend, but it cannot directly replace the DAT bridge.

## Component boundaries

### Wearables adapter

- Configures Meta DAT.
- Handles registration and camera permission.
- Owns device, camera, and stream lifecycle.
- Publishes the latest frame and typed state/errors.
- Contains no AI-provider logic.

### Activation and audio

- Detects the supported trigger.
- Selects input route according to camera state.
- Records/transcribes the question.
- Plays TTS through the glasses when available.

### Tutor orchestrator

- Coordinates one user turn.
- Freezes/selects a useful frame.
- Cancels stale turns.
- Requests a concise answer.
- Owns no hardware-specific code.

### Vision backend interface

- Accepts image + question + optional conversation context.
- May target a laptop service, cloud API, or on-device model.
- Returns text plus structured error/latency metadata.

### Storage

- MVP stores settings and redacted diagnostics only.
- Memory-assistant media and metadata are added in a later milestone behind explicit user action.

## Audio constraint to prove

OpenVision's physical-device testing reports that the Bluetooth HFP glasses microphone becomes unavailable while the DAT camera stream is active. We treat this as a risk, not a universal fact, until tested on our exact device.

Candidate interaction designs:

1. **Capture then listen:** obtain a frame, pause/stop stream, listen through glasses mic, answer.
2. **Continuous view + phone mic:** keep camera stream active and use the iPhone microphone.
3. **Button-triggered snapshot:** hardware gesture selects the frame, followed by a short voice capture.

The chosen design will follow Milestones 6 and 7 evidence.

## Privacy defaults

- The capture LED remains part of the physical privacy signal.
- Raw frames are held only as long as needed for the current turn.
- Logs contain timestamps, states, durations, and error codes—not images, transcripts, API keys, serial numbers, or precise location.
- Cloud upload is disabled until a backend is explicitly configured.
- Memory capture is opt-in per item.

