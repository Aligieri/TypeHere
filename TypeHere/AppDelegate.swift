//
//  AppDelegate.swift
//  TypeHere
//
//  Created by Stanislav Ursakii on 17.06.24.
//

import Foundation
import AppKit

class AppDelegate: NSObject, NSApplicationDelegate, NSWindowDelegate {
    var window: NSWindow!

    func applicationDidFinishLaunching(_ notification: Notification) {
        // Find the key window and set its properties
        if let window = NSApplication.shared.windows.first {
            self.window = window
            self.window.setContentSize(NSSize(width: 600, height: 45))
            self.window.styleMask = [.titled, .closable, .miniaturizable]
            self.window.delegate = self
            
            // Set minimum and maximum size to ensure fixed size
            self.window.minSize = NSSize(width: 600, height: 45)
            self.window.maxSize = NSSize(width: 600, height: 45)
        }
    }
}
