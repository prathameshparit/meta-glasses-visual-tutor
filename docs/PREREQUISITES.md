# Prerequisites

This checklist is a gate. Do not begin the first cloud build until all **Required for Milestone 2** items are known and satisfied.

## Hardware and device state

- [x] Ray-Ban Meta Wayfarer Gen 2 glasses available.
- [x] Glasses connected and working in Meta AI.
- [x] Glasses DAT component `0.9.0.26.0` installed.
- [x] Meta AI Developer Mode enabled.
- [x] Record the iPhone model without recording its serial number: iPhone 14.
- [x] Confirm the iOS version: `26.5`.
- [x] Confirm iOS is at least `17.2`, the minimum for Meta DAT iOS `0.9.0`.
- [x] Confirm at least 5 GB free iPhone storage for builds, logs, and captured media. **Current: 6 GB — PASS.**
- [ ] Confirm the Lightning/USB-C data cable supports data, not charging only.

On-device vision models are optional and will require a recent iPhone plus several additional gigabytes. They are not prerequisites for the first MVP.

## Accounts

- [x] GitHub account available: `prathameshparit`.
- [ ] Free Apple Account available for sideload signing.
- [ ] Apple Account has two-factor authentication working.
- [x] Meta account and Meta AI pairing available.
- [x] Source repository is public: `prathameshparit/meta-glasses-visual-tutor`.

Recommended: use a separate Apple Account for sideload development. Do not place its password in this repository or GitHub Actions.

Security note: a GitHub personal access token was exposed in chat during setup. The user reported it revoked on 2026-08-30. It was never used or stored by this project.

## Windows software

- [x] Git installed: `git version 2.37.2.windows.2`.
- [x] GitHub authentication configured. GitHub CLI `2.98.0` is authenticated as `prathameshparit` and stores its credential in the Windows keyring.
- [x] Sideloadly v0.60 installed and running from the user's local application directory.
- [x] Apple desktop iTunes `12.13.10.3` installed from Apple's signed 64-bit installer through the verified Windows Package Manager manifest.
- [x] Apple Devices for Windows `1.1540.23042.0` installed from Apple through Microsoft Store as a USB-pairing diagnostic.
- [ ] Compatible web iCloud installed. **FAIL: Apple's current Sideloadly-linked legacy installer (`7.21.0.23`) exits with Windows Installer error `1722` during its upgrade action.**
- [x] iPhone is visible to Windows over USB as `Apple Mobile Device USB Composite Device` with healthy status.
- [ ] iPhone trusts this Windows computer and appears in Sideloadly's device selector.
- [x] Windows has at least 10 GB free for source, downloaded IPA artifacts, and logs. **D: had 317.63 GB free at audit.**

Sideloadly's current documentation should be followed for the exact iTunes/iCloud packages; do not substitute unofficial downloads.

## iPhone setup

- [ ] Developer Mode enabled under iPhone privacy/security settings if requested after the first sideload.
- [ ] The free developer profile can be trusted under VPN & Device Management.
- [ ] Background App Refresh enabled for the test app when it exists.
- [ ] Bluetooth enabled.
- [ ] Local Network permission may be granted when requested.
- [ ] Microphone and Speech Recognition permissions may be granted when requested.

## Cloud build prerequisites

- [x] Repository created on GitHub: https://github.com/prathameshparit/meta-glasses-visual-tutor
- [x] GitHub Actions enabled for the repository; API audit reports `enabled: true` and `allowed_actions: all`.
- [ ] Workflow uses a current macOS/Xcode image compatible with the iPhone's iOS version.
- [ ] Workflow builds without signing: no Apple password, certificate, or provisioning profile in CI.
- [ ] Workflow uploads the unsigned IPA as a build artifact.

## AI prerequisites — deferred until camera validation

Choose only after Milestone 5 passes:

- Laptop-hosted vision model: no per-request API cost, more setup and network dependency.
- Cloud model: faster integration, but requires an API key and may cost money.
- On-iPhone model: private and offline, but device-dependent and resource-heavy.

No AI API key is required for signing, Meta registration, camera streaming, or audio smoke tests.

## Security rules

- Never commit `.env`, API keys, Apple cookies, Apple passwords, signing certificates, provisioning profiles, or Meta production client tokens.
- Use Meta Developer Mode with `MetaAppID = 0` for early hardware validation.
- Keep raw camera frames ephemeral by default.
- Do not upload frames until the user explicitly enables a cloud backend.
- Keep the glasses' capture indicator unobstructed and respect bystander privacy.
