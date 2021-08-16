//
//  Jailbreak_DetectionApp.swift
//  Jailbreak Detection
//
//  Created by Nikita Rossik on 8/12/21.
//

import SwiftUI

@main
struct Jailbreak_DetectionApp: App {
	let device = Device()

	var body: some Scene {
		WindowGroup { MainScreenView(model: device) }
	}
}
