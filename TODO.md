# NullPointer – Clipboard Manager

## 💡 Core Idea Bullets
- **Quick Paste** → lightning-fast, invisible hotkey pasting of the last N items.  
- **Workbench** → ephemeral floating scratchpad for active tasks.  
- **Archive** → smart, searchable long-term clipboard history.  
- Philosophy: keyboard-first, speed of thought, developer-focused.  
- Target platform: **macOS menu bar app** (no dock window).  
- Start with **text-only** → expand to richer types later.  
- Build incrementally, each spike fully usable on its own.  

---

## 🟢 First Spike: Quick Paste (Text-Only)

### What we’re doing
Building the smallest usable version of Quick Paste.  
- Focus on **text only**.  
- Store items in an **in-memory buffer** (last 10 entries).  
- Provide **global hotkeys** (`⌥⌃1..9`) to paste from history.  
- Trigger paste via **clipboard injection + ⌘V** (requires Accessibility permission).  
- Run as a **menu bar app** with a basic dropdown (Quit option).  

### TODO
- [x] Initialize Git repo with `.gitignore` for Xcode/macOS.  
- [x] Clean up boilerplate (remove default `ContentView`).  
- [x] Add `AppDelegate` → set up menu bar status item.  
- [x] Show simple menu bar icon.  
- [ ] Listen to clipboard text changes (`NSPasteboard`).  
- [ ] Keep last 10 entries in memory buffer.  
- [ ] Register global hotkeys (`⌥⌃1..9`).  
- [ ] On hotkey press → replace clipboard with buffer item.  
- [ ] Programmatically trigger paste (`⌘V`).  
- [ ] Verify end-to-end: copy → hotkey → text pastes.  

---

## 🔜 Notes
- Future spikes will add Workbench and Archive.  
- This file grows as the project evolves—each stage gets its own TODO section.  
