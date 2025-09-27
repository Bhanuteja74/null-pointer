import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem?

    func applicationDidFinishLaunching(_ notification: Notification) {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

        if let button = statusItem?.button {
            button.image = NSImage(systemSymbolName: "doc.on.clipboard", accessibilityDescription: "NullPointer")
            button.action = #selector(statusBarButtonClicked)
        }

        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Quit NullPointer", action: #selector(quit), keyEquivalent: "q"))
        statusItem?.menu = menu
    }

    @objc func statusBarButtonClicked() {
        statusItem?.menu?.popUp(positioning: nil, at: NSEvent.mouseLocation, in: nil)
    }

    @objc func quit() {
        NSApp.terminate(nil)
    }
}

