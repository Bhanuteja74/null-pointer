import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem?
    var clipBoardTimer: Timer?
    var clipBoardBuffer:[String] = []
    var lastChangedCount: Int = 0

    func applicationDidFinishLaunching(_ notification: Notification) {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

        if let button = statusItem?.button {
            button.image = NSImage(systemSymbolName: "doc.on.clipboard", accessibilityDescription: "NullPointer")
            button.action = #selector(statusBarButtonClicked)
        }

        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Quick Paste", action: #selector(showQuickPaste), keyEquivalent: ""))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit NullPointer", action: #selector(quit), keyEquivalent: "q"))
        statusItem?.menu = menu
        
        lastChangedCount = NSPasteboard.general.changeCount
        startClipboardPolling()
    }

    @objc func showQuickPaste() {
        let alert = NSAlert()
        alert.messageText = "Quick Paste Buffer"
        alert.informativeText = clipBoardBuffer.joined(separator: "\n")
        alert.addButton(withTitle: "Close")
        alert.runModal()
    }
    
    func startClipboardPolling() {
        clipBoardTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(checkClipboard), userInfo: nil, repeats: true)
    }
    
    @objc func checkClipboard() {
        let pasteboard = NSPasteboard.general
        if pasteboard.changeCount != lastChangedCount {
            lastChangedCount = pasteboard.changeCount
            if let newText = pasteboard.string(forType: .string), !newText.isEmpty {
                addTextToBuffer(newText)
            }
        }
    }
    
    func addTextToBuffer(_ text: String) {
        clipBoardBuffer.append(text)
    }
    
    @objc func statusBarButtonClicked() {
        statusItem?.menu?.popUp(positioning: nil, at: NSEvent.mouseLocation, in: nil)
    }

    @objc func quit() {
        NSApp.terminate(nil)
    }
}

