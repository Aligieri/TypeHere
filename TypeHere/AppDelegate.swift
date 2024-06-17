//
//  AppDelegate.swift
//  TypeHere
//
//  Created by Stanislav Ursakii on 17.06.24.
//

import Foundation
import AppKit
import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate, NSWindowDelegate {
    var window: NSWindow?

    func applicationDidFinishLaunching(_ notification: Notification) {
        // No need to manage window here since it's handled by WindowAccessor
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return false
    }

    func applicationDidBecomeActive(_ notification: Notification) {
        if let window = NSApplication.shared.windows.first {
            window.makeKeyAndOrderFront(self)
        } else {
            let contentView = ContentView()
                .frame(minWidth: 600, idealWidth: 600, maxWidth: .infinity, minHeight: 45, idealHeight: 45, maxHeight: .infinity)
                .background(WindowAccessor()) // Attach the accessor

            let window = NSWindow(
                contentRect: NSRect(x: 0, y: 0, width: 600, height: 45),
                styleMask: [.titled, .closable, .miniaturizable, .resizable],
                backing: .buffered, defer: false)
            window.center()
            window.setFrameAutosaveName("Main Window")
            window.contentView = NSHostingView(rootView: contentView)
            window.makeKeyAndOrderFront(nil)
            window.delegate = self
            self.window = window
        }
    }
}
