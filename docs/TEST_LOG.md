# Test log

Append new entries. Do not rewrite failed results after a fix; create a new entry so the diagnostic history remains useful.

## Entry template

### T-YYYYMMDD-NN — Short test name

- Milestone:
- Build/commit:
- Date/time and timezone:
- Tester:
- Environment:
  - Windows version:
  - iPhone model/iOS:
  - Meta AI version:
  - Glasses release:
  - On-glasses DAT version:
- Preconditions:
- Steps:
  1.
- Expected:
- Actual:
- Result: PASS / FAIL / BLOCKED
- Evidence: artifact name, screenshot name, relevant redacted log excerpt
- Follow-up:

## T-20260830-01 — Device/developer-mode screenshot audit

- Milestone: 0
- Build/commit: documentation only
- Date/time and timezone: 2026-08-30, Asia/Calcutta
- Tester: user supplied evidence; Codex reviewed
- Environment:
  - iPhone model/iOS: not yet recorded
  - Meta AI version: `287.0.0.11.156`
  - Glasses release: `127.14.0.220.436`
  - On-glasses DAT version: `0.9.0.26.0`
- Preconditions: glasses paired in Meta AI.
- Steps:
  1. Inspect Meta AI App Info screenshot.
  2. Inspect glasses About screenshot.
- Expected: Developer Mode enabled and glasses/DAT visible.
- Actual: Developer Mode is enabled; connected glasses and DAT version are visible.
- Result: PASS
- Evidence: user-provided screenshots; serial numbers deliberately omitted.
- Follow-up: record iPhone model, iOS version, and free storage during Milestone 1.

## T-20260830-02 — Documentation consistency

- Milestone: 0
- Build/commit: documentation only
- Date/time and timezone: 2026-08-30, Asia/Calcutta
- Tester: Codex
- Preconditions: documentation files created.
- Steps:
  1. Verify all handbook files exist.
  2. Verify only Milestone 0 is marked done.
  3. Verify the next action is the prerequisite audit.
- Expected: documents agree on status and next gate.
- Actual: all seven handbook files exist; status markers agree that Milestone 0 is done and Milestone 1 is next.
- Result: PASS
- Evidence: `rg --files` plus status-marker review on 2026-08-30.
- Follow-up: begin Milestone 1 with the iPhone model, iOS version, and free-storage check.

## T-20260830-03 — Initial prerequisite audit

- Milestone: 1
- Build/commit: documentation only
- Date/time and timezone: 2026-08-30, Asia/Calcutta
- Tester: user supplied device evidence; Codex ran Windows checks
- Environment:
  - Windows workspace drive: 317.63 GB free
  - iPhone model/iOS: iPhone 14 / iOS `26.5`
  - iPhone capacity/free: 128 GB / 3.85 GB
  - Meta AI version: `287.0.0.11.156`
  - Glasses release: `127.14.0.220.436`
  - On-glasses DAT version: `0.9.0.26.0`
- Preconditions: Sideloadly v0.60 installer run; iPhone About screenshot supplied.
- Steps:
  1. Inspect the iPhone model, iOS, capacity, and available-storage fields.
  2. Inspect the Sideloadly setup completion screen.
  3. Run `git --version` and check workspace free space.
  4. Query installed Apple components, Apple Mobile Device service, and connected Apple PnP devices.
- Expected: compatible iPhone, at least 5 GB free, Git/Sideloadly/Apple components present, and iPhone visible to Windows.
- Actual: iPhone and iOS are compatible; Git and Windows storage pass. iPhone storage is below the project minimum. Sideloadly v0.60 is installed and its app plus refresh daemon are running. Required Apple components, service, and connected iPhone were not detected.
- Result: BLOCKED
- Evidence: user screenshots plus redacted PowerShell prerequisite output. The phone serial number was not recorded.
- Follow-up:
  1. Free at least 1.15 GB more on the iPhone, preferably reaching 8–10 GB for safer test iterations.
  2. Install/repair the exact iTunes and iCloud desktop packages required by Sideloadly.
  3. Connect the unlocked iPhone by data cable, tap Trust, and repeat device/service checks.

## T-20260830-04 — GitHub account and CLI preparation

- Milestone: 1
- Build/commit: documentation and local tooling
- Date/time and timezone: 2026-08-30, Asia/Calcutta
- Tester: Codex
- Environment:
  - GitHub account: `prathameshparit`
  - GitHub CLI: `2.98.0`
- Preconditions: user supplied a GitHub profile and a personal access token in chat.
- Steps:
  1. Verify the public GitHub profile exists.
  2. Refuse to use or store the exposed token.
  3. Install GitHub CLI from the Windows package manager.
  4. Verify GitHub CLI reports no authenticated host.
- Expected: GitHub account confirmed and a secret-free authentication path prepared.
- Actual: account confirmed; GitHub CLI installed; authentication intentionally deferred until the exposed token is revoked.
- Result: BLOCKED
- Evidence: GitHub public profile and local `gh --version` / `gh auth status` output.
- Follow-up:
  1. Revoke the exposed personal access token in GitHub settings.
  2. Authenticate with `gh auth login` using the browser/device flow.
  3. Create the project repository without storing credentials in files or command arguments.

## T-20260830-05 — Secure GitHub authentication

- Milestone: 1
- Build/commit: documentation and local tooling
- Date/time and timezone: 2026-08-30, Asia/Calcutta
- Tester: user completed GitHub device authorization; Codex verified status
- Environment:
  - GitHub account: `prathameshparit`
  - GitHub CLI: `2.98.0`
  - Credential storage: Windows keyring
- Preconditions: exposed personal access token reported revoked by the user.
- Steps:
  1. Start GitHub CLI browser/device authorization.
  2. User approves the one-time device code on GitHub.
  3. Run `gh auth status` without displaying credential contents.
- Expected: active GitHub login stored outside the repository and command-line environment.
- Actual: GitHub CLI reports an active `prathameshparit` login using the keyring with repository and workflow access.
- Result: PASS
- Evidence: redacted `gh auth status` output.
- Follow-up: choose repository visibility, then create the remote and push the documentation baseline.

## T-20260830-06 — Public repository creation

- Milestone: 1
- Build/commit: `b2e321d`
- Date/time and timezone: 2026-08-30, Asia/Calcutta
- Tester: Codex
- Environment:
  - GitHub account: `prathameshparit`
  - Repository: `prathameshparit/meta-glasses-visual-tutor`
  - Default branch: `main`
- Preconditions: secure GitHub CLI login active; user approved repository creation and public visibility.
- Steps:
  1. Create the public repository using GitHub CLI.
  2. Add `origin` and push local `main`.
  3. Query repository visibility, default branch, and Actions permissions.
- Expected: public remote exists, tracks local `main`, and permits Actions workflows.
- Actual: repository is public, `main` tracks `origin/main`, and Actions is enabled with all actions allowed.
- Result: PASS
- Evidence: GitHub CLI repository JSON and Actions permissions API response.
- Follow-up: finish the remaining iPhone storage and Apple Windows connection prerequisites.

## T-20260830-07 — Apple desktop iTunes installation

- Milestone: 1
- Build/commit: local infrastructure
- Date/time and timezone: 2026-08-30, Asia/Calcutta
- Tester: Codex
- Environment:
  - Windows package: `Apple.iTunes` `12.13.10.3`
  - Installer source: `secure-appldnld.apple.com`
  - Installer type: Apple 64-bit desktop EXE, not Microsoft Store
- Preconditions: Sideloadly v0.60 installed; Apple device components not previously detected.
- Steps:
  1. Confirm Sideloadly's FAQ requires desktop/web iTunes for Windows device detection.
  2. Inspect the Windows Package Manager manifest and confirm the publisher, Apple download URL, and SHA-256 are present.
  3. Install `Apple.iTunes` through Windows Package Manager.
  4. Verify iTunes `12.13.10.3` is installed and launch it for interactive device trust.
- Expected: Apple's desktop iTunes installs successfully and is ready for the physical USB trust test.
- Actual: package installed successfully and iTunes launched. No iPhone was present during the post-install device query, so USB detection remains untested.
- Result: PASS
- Evidence: package-manager hash verification, successful installation result, installed-package query, and `C:\Program Files\iTunes` presence.
- Follow-up:
  1. Connect and unlock the iPhone with a data cable.
  2. Tap Trust on the iPhone and complete any matching iTunes prompt.
  3. Verify the device in iTunes, Windows PnP, and Sideloadly.
  4. Install iCloud only if the later IPA signing test reports an Anisette requirement.

## T-20260830-08 — iTunes Store sign-in

- Milestone: 1
- Build/commit: local infrastructure
- Date/time and timezone: 2026-08-30, Asia/Calcutta
- Tester: user supplied screenshot
- Preconditions: Apple desktop iTunes `12.13.10.3` installed and launched.
- Steps:
  1. Attempt to access/sign in to the iTunes Store.
- Expected: iTunes Store request completes.
- Actual: iTunes reports temporary unknown error `-45054` and links Apple Support article `108339`.
- Result: FAIL — NON-BLOCKING
- Evidence: user-supplied screenshot.
- Follow-up: do not modify iTunes Store authorization data because store sign-in is not needed for USB device detection or Sideloadly. Revisit only if a later signing test proves it relevant.

## T-20260830-09 — Windows USB detection of iPhone

- Milestone: 1
- Build/commit: local infrastructure
- Date/time and timezone: 2026-08-30, Asia/Calcutta
- Tester: Codex
- Preconditions: iPhone connected by USB after desktop iTunes installation.
- Steps:
  1. Query present Windows Plug and Play devices for Apple USB identifiers.
  2. Check reported device status.
  3. Launch Sideloadly for interactive device selection.
- Expected: Windows recognizes the physical iPhone through Apple USB support.
- Actual: Windows reports `Apple Mobile Device USB Composite Device` and its MTP interface with status `OK`. Sideloadly was launched; its device-selector result requires visual confirmation.
- Result: PASS for Windows USB detection; Sideloadly selection pending.
- Evidence: redacted PnP query output; device instance serial omitted.
- Follow-up: confirm that the iPhone appears in Sideloadly's device drop-down. No iTunes Store sign-in is required.

## T-20260830-10 — Storage and Sideloadly device-selector gate

- Milestone: 1
- Build/commit: `fe18aaa`
- Date/time and timezone: 2026-08-30, Asia/Calcutta
- Tester: user
- Preconditions: iPhone connected by USB; desktop iTunes installed; Windows PnP test passed.
- Steps:
  1. Check iPhone available storage.
  2. Inspect Sideloadly's device drop-down with the iPhone connected.
- Expected: at least `5 GB` iPhone free storage and a selectable iPhone in Sideloadly.
- Actual: iPhone has `6 GB` free storage (PASS). User reports the iPhone does not appear in Sideloadly (FAIL).
- Result: FAIL — prerequisite audit remains open.
- Evidence: user report.
- Follow-up: establish Apple pairing/trust and retest Sideloadly; do not begin a cloud build.

## T-20260830-11 — Legacy web iCloud installation

- Milestone: 1
- Build/commit: local infrastructure
- Date/time and timezone: 2026-08-30, Asia/Calcutta
- Tester: Codex
- Environment: Apple-signed iCloud installer `7.21.0.23`, downloaded from the current web-iCloud link on Sideloadly's site.
- Preconditions: Sideloadly device selector reports no iPhone; iTunes desktop is installed.
- Steps:
  1. Verify the installer signature belongs to Apple Inc.
  2. Run the installer silently.
  3. Retry elevated after the first attempt reports insufficient privileges.
  4. Query Windows Installer events and installed-product/service state.
- Expected: iCloud installs and its Apple connection components become available.
- Actual: the first attempt exits `1603` due to insufficient privileges. The elevated retry reaches `RuniCloudUpgrade` but fails with Windows Installer error `1722` while executing `iCloud.exe /upgrade`; iCloud is not registered as installed.
- Result: FAIL.
- Evidence: local installer log and Windows Installer events; no iCloud product/service detected after retry.
- Follow-up: use Apple Devices for an interactive trust/pairing check, then retest Sideloadly. Do not claim iCloud is installed.

## T-20260830-12 — Apple Devices pairing diagnostic

- Milestone: 1
- Build/commit: local infrastructure
- Date/time and timezone: 2026-08-30, Asia/Calcutta
- Tester: Codex; trust confirmation pending from user
- Environment: Apple Devices `1.1540.23042.0`, installed from Microsoft Store; iPhone attached by USB.
- Steps:
  1. Install Apple Devices from the official Microsoft Store package.
  2. Launch it with the iPhone connected.
  3. Query installed package and connected PnP devices.
- Expected: Apple Devices launches and presents a trust/pairing opportunity for the connected iPhone.
- Actual: the Apple Devices package is installed and was launched. Windows still reports the iPhone USB and MTP interfaces as healthy; no Apple Mobile Device Service appeared in the immediate post-launch query. Interactive trust/pairing and the Sideloadly retest are pending.
- Result: BLOCKED.
- Evidence: installed Appx package query and redacted PnP query.
- Follow-up: unlock the iPhone, accept any Trust prompt in Apple Devices/iPhone, then reopen Sideloadly and verify its drop-down.

## T-20260830-13 — Sideloadly USB device-selector confirmation

- Milestone: 1
- Build/commit: `d2a4cd5`
- Date/time and timezone: 2026-08-30, Asia/Calcutta
- Tester: user
- Preconditions: iPhone unlocked and connected by USB; Apple Devices installed and launched; Sideloadly restarted.
- Steps:
  1. Inspect Sideloadly's iDevice selector.
  2. Verify the connected iPhone is presented as a USB device.
- Expected: the iPhone is selectable in Sideloadly.
- Actual: Sideloadly displays `Prathamesh's iPhone (26.5)` with a USB connection in the iDevice selector.
- Result: PASS.
- Evidence: user-supplied screenshot; device identifier intentionally omitted from the repository.
- Follow-up: confirm a free Apple Account with working two-factor authentication before starting the signed-install milestone. The unsigned cloud-build milestone does not require those credentials.
