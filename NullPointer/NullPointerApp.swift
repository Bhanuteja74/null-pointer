import SwiftUI

@main
struct NullPointerApp: App {
    // Connect AppDelegate
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        // No WindowGroup needed for menu bar app
        Settings {
            EmptyView() // placeholder if you want a settings window later
        }
    }
}
