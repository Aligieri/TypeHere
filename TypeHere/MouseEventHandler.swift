import Cocoa

func simulateMouseClick(at point: CGPoint) {
    let mouseEventDown = CGEvent(mouseEventSource: nil, mouseType: .leftMouseDown, mouseCursorPosition: point, mouseButton: .left)
    let mouseEventUp = CGEvent(mouseEventSource: nil, mouseType: .leftMouseUp, mouseCursorPosition: point, mouseButton: .left)
    
    mouseEventDown?.post(tap: .cghidEventTap)
    mouseEventUp?.post(tap: .cghidEventTap)
}
