# Decision log

## D-001 — Free sideloading instead of TestFlight

**Status:** Accepted

Use GitHub Actions to compile an unsigned IPA and Sideloadly to sign/install it with a free Apple Account.

Why: no Mac ownership and no Apple Developer Program fee.

Consequences:

- Seven-day signing expiry and refresh work.
- Development is limited to registered personal devices.
- No public TestFlight/App Store distribution.
- Build/test feedback is slower than local Xcode.

## D-002 — Physical iPhone remains the Meta DAT bridge

**Status:** Accepted

The Windows laptop cannot directly access the glasses camera through an official desktop DAT SDK. The iPhone will own the glasses connection; compute may move to the laptop later.

## D-003 — Validate official CameraAccess before adopting a large app

**Status:** Accepted

Use Meta's official CameraAccess sample as the hardware and permission baseline. Treat OpenVision as a reference for wake words, audio routing, backend seams, and reliability patterns.

Why: starting with a feature-rich app would mix signing, Meta registration, camera, audio, AI, local models, and UI failures in one test.

## D-004 — Meta DAT version line

**Status:** Accepted

Target Meta DAT `0.9.x` initially because the glasses report DAT `0.9.0.26.0`. Pin the exact package version in code once the first successful build is established; do not float dependencies automatically.

## D-005 — AI backend is deferred

**Status:** Accepted

No AI provider is chosen until registration, camera streaming, trigger, and audio routing are proven. The app will use a provider interface so laptop, cloud, and on-device implementations remain replaceable.

## D-006 — Evidence before milestone progression

**Status:** Accepted

Every milestone must include a test-log entry with environment, steps, expected result, actual result, and evidence. “It should work” does not close a gate.

