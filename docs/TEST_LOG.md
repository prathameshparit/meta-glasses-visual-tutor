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

## T-20260830-14 — Free Apple Account readiness

- Milestone: 1
- Build/commit: `262fcf3`
- Date/time and timezone: 2026-08-30, Asia/Calcutta
- Tester: user
- Preconditions: Sideloadly USB device-selector gate passed.
- Steps:
  1. Confirm a free Apple Account is available for the later Sideloadly install.
  2. Confirm that its two-factor authentication can be approved.
- Expected: a free Apple Account and its two-factor authentication are available without storing credentials in the project.
- Actual: user confirmed both are ready. No account identifier, password, session data, or verification code was requested or stored.
- Result: PASS — Milestone 1 acceptance gate passes.
- Evidence: user confirmation; repository credential-pattern scan is clean.
- Follow-up: begin Milestone 2 with a minimal unsigned IPA cloud build.

## T-20260830-15 — Unsigned iPhone cloud-build proof

- Milestone: 2
- Build/commit: `1edfb43` (`1edfb43892dd445f9557431371fc3b025a9465a6`)
- Date/time and timezone: 2026-08-30, Asia/Calcutta
- Tester: Codex
- Environment: GitHub Actions macOS runner; workflow run `33310081411`; Xcode project target `VisualTutorProof` with iOS deployment target `17.2`.
- Preconditions: Milestone 1 passed; no Apple credentials, certificates, provisioning profiles, or signing secrets are available to the workflow.
- Steps:
  1. Trigger the workflow by pushing the minimal SwiftUI proof app and workflow.
  2. Compile the iPhone target with `CODE_SIGNING_ALLOWED=NO`, `CODE_SIGNING_REQUIRED=NO`, and an empty signing identity.
  3. Package the generated app inside an IPA `Payload/` directory and upload it with commit/build metadata.
  4. Download the artifact locally and inspect its ZIP entries and metadata.
- Expected: a green workflow produces an unsigned IPA containing `Payload/VisualTutorProof.app` and an `Info.plist`, tied to the source commit.
- Actual: run `33310081411` passed in 25 seconds. Downloaded artifact `VisualTutorProof-1edfb43.ipa` is 15,529 bytes, contains `Payload/VisualTutorProof.app` (including `Info.plist`), and its metadata records the full commit SHA and build `1`.
- Result: PASS — Milestone 2 acceptance gate passes.
- Evidence: GitHub Actions run and locally inspected downloaded artifact. The runner emitted a Node 20 deprecation notice for GitHub-maintained actions but it did not affect this build.
- Follow-up: use this exact artifact in Sideloadly for Milestone 3; record the physical launch result before adding Meta SDK code.

## T-20260830-16 — First free-sideload installation attempt

- Milestone: 3
- Build/commit: unsigned IPA from `1edfb43`; Sideloadly-side signing uses the user's private Apple Account.
- Date/time and timezone: 2026-08-30, Asia/Calcutta
- Tester: user
- Preconditions: Sideloadly detects the iPhone over USB; verified unsigned IPA selected; Apple Account and two-factor authentication available.
- Steps:
  1. Select the verified IPA in Sideloadly.
  2. Complete local Apple Account authentication and any device-side approval without exposing credentials to the project.
  3. Start the installation.
- Expected: Sideloadly signs and installs the proof app on the connected iPhone.
- Actual: user reports the process appears complete. No Sideloadly completion log or iPhone launch screen has been supplied yet.
- Result: PENDING — do not close Milestone 3 until the app is launched on the iPhone.
- Evidence: user report only; no credentials, codes, or account identifiers recorded.
- Follow-up: locate and open **Visual Tutor** on the iPhone. Confirm it displays `Cloud build proof` and `Build 1`, then record any iOS Developer Mode/profile-trust prompt and the expiry date Sideloadly reports.

## T-20260830-17 — First app launch blocked by developer-profile trust

- Milestone: 3
- Build/commit: unsigned IPA from `1edfb43`, installed through Sideloadly.
- Date/time and timezone: 2026-08-30, Asia/Calcutta
- Tester: user
- Preconditions: the proof app is present on the iPhone after Sideloadly installation.
- Steps:
  1. Open **Visual Tutor** on the iPhone.
- Expected: the proof screen launches.
- Actual: iOS reports that device-management settings do not allow apps from the `iPhone Developer: Prathamesh Parit` profile and directs the user to Settings to allow it.
- Result: FAIL — expected iOS free-sideload trust requirement, not a build or installation failure.
- Evidence: user-reported iPhone error text; no Apple Account identifier is recorded.
- Follow-up: in iPhone **Settings → General → VPN & Device Management**, select the developer profile and tap **Trust** / **Allow**. If that menu has no profile, confirm **Settings → Privacy & Security → Developer Mode** is enabled, restart when iOS requests it, then retry the app.

## T-20260830-18 — First app launch blocked by Developer Mode

- Milestone: 3
- Build/commit: unsigned IPA from `1edfb43`, installed through Sideloadly.
- Date/time and timezone: 2026-08-30, Asia/Calcutta
- Tester: user
- Preconditions: developer profile has been accepted sufficiently for iOS to evaluate app execution.
- Steps:
  1. Retry opening **Visual Tutor** after the developer-profile prompt.
- Expected: the proof screen launches.
- Actual: iOS reports that **Visual Tutor requires Developer Mode to run** and will remain unavailable until Developer Mode is enabled.
- Result: FAIL — expected iOS sideload security requirement, not a build failure.
- Evidence: user-reported iPhone error text.
- Follow-up: go to **Settings → Privacy & Security → Developer Mode**, turn it on, approve the restart, unlock after restart, and approve the final Developer Mode confirmation. Then open **Visual Tutor** again.

## T-20260830-19 — Physical launch of the free-signed proof app

- Milestone: 3
- Build/commit: `1edfb43`; GitHub Actions build `1`.
- Date/time and timezone: 2026-08-30, Asia/Calcutta
- Tester: user
- Preconditions: the IPA was installed through Sideloadly; the developer profile was trusted; iPhone Developer Mode was enabled and the device restarted.
- Steps:
  1. Open **Visual Tutor** on the physical iPhone.
  2. Inspect the proof screen's build label.
- Expected: the app launches and displays the cloud-build proof with build `1`.
- Actual: user reports that **Visual Tutor** opens successfully and displays `Cloud build proof` and `Build 1`.
- Result: PASS for installation, iOS profile trust, Developer Mode, physical launch, and build-identifier match.
- Evidence: user confirmation.
- Follow-up: Milestone 3 is complete. The proof app has no persisted user data, so reinstall-data preservation is not applicable. Exact signing-expiry evidence and a refresh test move to Milestone 14 by D-010.

## T-20260830-20 — Free-sideload proof acceptance

- Milestone: 3
- Build/commit: `1edfb43`; proof evidence recorded through `a6f2df4`.
- Date/time and timezone: 2026-08-30, Asia/Calcutta
- Tester: Codex
- Acceptance review:
  - Physical iPhone app launch: PASS (T-20260830-19).
  - Visible build identifier: PASS (T-20260830-19, Build `1`).
  - Reinstall data persistence: not applicable; the proof app is intentionally stateless.
  - Signing expiry/refresh: deferred to Milestone 14 by D-010.
- Result: PASS — Milestone 3 complete; Milestone 4 may begin.
- Evidence: physical-device launch confirmation and prior build-artifact inspection.
