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

## D-007 — Desktop Apple tooling for Sideloadly device discovery

**Status:** Superseded by device-detection evidence

Install Apple's desktop iTunes package for USB device/trust support. Begin with Sideloadly Remote Anisette and defer iCloud unless a signing test requires it.

Why: iCloud is not needed for USB device detection, and Sideloadly supports Remote Anisette. If the first signing test reports an Anisette-specific failure, install the compatible desktop iCloud package and retest.

Consequence: Remote Anisette sends limited environment metadata to Sideloadly's Anisette service as described in its FAQ; Apple credentials are still sent to Apple rather than stored in the repository.

Superseding evidence: Windows detected the iPhone but Sideloadly's device selector did not. Sideloadly's current troubleshooting guide explicitly directs a web iTunes/iCloud reinstall and reboot. The linked legacy iCloud installer failed on this Windows host with error `1722`, so it is not a viable prerequisite until its installer compatibility is resolved.

## D-008 — Use Apple Devices as the non-destructive pairing diagnostic

**Status:** Accepted

Install the free Apple Devices Windows app alongside desktop iTunes to establish the iPhone trust/pairing path and current Apple device components.

Why: Apple officially uses this app to manage iPhone connections on current Windows releases. The existing desktop iTunes installation did not expose a running Apple Mobile Device Service, while the iPhone was detectable only as a Windows USB/MTP device.

Consequence: this is a diagnostic compatibility path, not a replacement for Sideloadly's documented legacy iCloud requirement. We must prove the actual Sideloadly selector result before continuing.

## D-009 — Unsigned IPA packaging in GitHub Actions

**Status:** Accepted

The initial app is compiled on a GitHub-hosted macOS runner with every code-signing setting disabled. The workflow packages the resulting `.app` inside `Payload/` in an IPA and uploads it with commit/build metadata.

Why: it proves Windows-only editing can produce an inspectable iPhone artifact without an Apple certificate, provisioning profile, or paid developer membership.

Consequence: this artifact cannot launch until Sideloadly signs it locally with the user's Apple Account. The source build is deliberately tiny until that installation proof passes.

## D-010 — Defer exact signing-expiry evidence to the maintenance rehearsal

**Status:** Accepted

The free-sideload proof milestone is complete once the stateless proof app launches and displays the expected build. Record the exact expiry date and perform a real refresh in Milestone 14 using the feature app rather than delaying hardware integration for administrative information.

Why: the proof app has no user data, while Milestone 14 is explicitly designed to validate signing expiry, refresh, and persistence on the relevant app state.
