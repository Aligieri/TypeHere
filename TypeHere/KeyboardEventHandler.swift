import Cocoa

func simulateKeyPress(with inputData: String) {
    let source = CGEventSource(stateID: .combinedSessionState)
    
    for char in inputData {
        if let keyDown = CGEvent(keyboardEventSource: source, virtualKey: 0, keyDown: true),
           let keyUp = CGEvent(keyboardEventSource: source, virtualKey: 0, keyDown: false) {
            
            let charString = String(char)
            let charArray = Array(charString.utf16)
            
            keyDown.keyboardSetUnicodeString(stringLength: charArray.count, unicodeString: charArray)
            keyUp.keyboardSetUnicodeString(stringLength: charArray.count, unicodeString: charArray)
            
            keyDown.post(tap: .cghidEventTap)
            keyUp.post(tap: .cghidEventTap)
        }
    }
}
