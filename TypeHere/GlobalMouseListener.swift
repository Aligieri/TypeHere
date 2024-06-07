import Cocoa

class GlobalMouseListener {
    private var eventMonitor: Any?
    private var eventHandler: ((CGPoint) -> Void)?
    
    init() {}
    
    deinit {
        stopListening()
    }
    
    func startListening(handler: @escaping (CGPoint) -> Void) {
        self.eventHandler = handler
        eventMonitor = NSEvent.addGlobalMonitorForEvents(matching: .leftMouseDown) { [weak self] event in
            if let self = self {
                self.eventHandler?(event.locationInWindow)
            }
        }
    }
    
    func stopListening() {
        if eventMonitor != nil {
            NSEvent.removeMonitor(eventMonitor!)
            eventMonitor = nil
        }
    }
}
