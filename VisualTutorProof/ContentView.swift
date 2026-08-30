import SwiftUI

struct ContentView: View {
    private let buildNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? "unknown"

    var body: some View {
        VStack(spacing: 18) {
            Image(systemName: "eyeglasses")
                .font(.system(size: 54))
                .foregroundStyle(.tint)

            Text("Visual Tutor")
                .font(.largeTitle.bold())

            Text("Cloud build proof")
                .foregroundStyle(.secondary)

            Text("Build \(buildNumber)")
                .font(.footnote.monospaced())
                .padding(.top, 10)
        }
        .padding()
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Visual Tutor cloud build proof, build \(buildNumber)")
    }
}

#Preview {
    ContentView()
}
