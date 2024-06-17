//
//  TypeHereApp.swift
//  TypeHere
//
//  Created by Stanislav Ursakii on 07.06.24.
//

import SwiftUI

@main
struct TypeHereApp: App { 
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 600, idealWidth: 600, maxWidth: .infinity, minHeight: 45, idealHeight: 87, maxHeight: .infinity)
                        .background(WindowAccessor()) // Attach the accessor
        }
    }
}

struct WindowAccessor: NSViewRepresentable {
    func makeNSView(context: Context) -> NSView {
        let view = NSView()
        DispatchQueue.main.async {
            if let window = view.window {
                // Set initial size
                window.setContentSize(NSSize(width: 600, height: 87))
                window.styleMask = [.titled, .closable, .miniaturizable, .resizable]
                // Set minimum and maximum sizes
                window.minSize = NSSize(width: 600, height: 45)
                window.maxSize = NSSize(width: 800, height: 600) // Adjust as needed
            }
        }
        return view
    }

    func updateNSView(_ nsView: NSView, context: Context) {}
}
