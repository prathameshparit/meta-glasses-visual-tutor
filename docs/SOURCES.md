# Source index

Last reviewed: **2026-08-30**. External SDKs and platform policies change; verify these sources again before changing pinned versions or signing strategy.

## Primary sources

### Meta Wearables Device Access Toolkit for iOS

- Repository: https://github.com/facebook/meta-wearables-dat-ios
- Agent/reference guide: https://github.com/facebook/meta-wearables-dat-ios/blob/main/AGENTS.md
- Changelog: https://github.com/facebook/meta-wearables-dat-ios/blob/main/CHANGELOG.md
- CameraAccess sample: https://github.com/facebook/meta-wearables-dat-ios/tree/main/samples/CameraAccess
- Developer site: https://developers.meta.com/wearables/

Facts currently relied upon:

- DAT supports native iOS camera streaming and photo capture.
- Developer Mode registration may use `MetaAppID = 0`.
- DAT `0.9.0` requires iOS `17.2+`.
- The physical iPhone is required for real glasses; MockDeviceKit is for simulation.

### Sideloadly

- Main site: https://sideloadly.io/
- FAQ: https://sideloadly.io/faq.html

Facts currently relied upon:

- It supports Windows and free Apple Accounts.
- Free-signed apps expire after seven days.
- Automatic refresh is available when correctly configured.

### GitHub Actions

- Billing overview: https://docs.github.com/en/billing/managing-billing-for-your-products/managing-billing-for-github-actions
- macOS hosted runners: https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners

Before the first build, verify the current free-minute policy for public and private repositories and the available macOS/Xcode images.

## Reference implementation

### OpenVision

- Repository: https://github.com/rayl15/OpenVision
- Releases: https://github.com/rayl15/OpenVision/releases
- Setup guide: https://github.com/rayl15/OpenVision/blob/main/SETUP.md

Use as reference for:

- Wake-word and voice-loop behavior.
- Audio routing observations.
- Live-frame selection.
- Pluggable AI backends.
- On-device model tradeoffs.

Do not copy configuration blindly: OpenVision evolves independently and may pin a different DAT version or iOS minimum.

## Source precedence

When sources disagree:

1. Current Meta DAT `0.9.x` documentation and official sample.
2. Current Apple/GitHub/Sideloadly documentation for their respective platforms.
3. Reproducible results on our physical device.
4. OpenVision and community reports as diagnostic references.

