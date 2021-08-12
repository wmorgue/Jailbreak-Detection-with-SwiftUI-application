//
//  MainScreenView.swift
//  Jailbreak Detection
//
//  Created by Nikita Rossik on 8/12/21.
//

import SwiftUI

struct MainScreenView: View {
	var body: some View {
		Text(mainText)
			.padding()

		if canOpenCydia() {
			Button("Open Cydia") {
				openCydiaApplication
			}
			.foregroundColor(.primary)
		}
	}
}




extension MainScreenView {
	private var mainText: String {
		switch isJailbroken() {
			case true: return "Device is Jailbroken"
			case false: return "Not a Jailbroken"
		}
	}

	private func isJailbroken() -> Bool {
		#if targetEnvironment(simulator)
		return false
		#endif

		let fm: FileManager = .default

		if fm.fileExists(atPath: "/usr/lib/substrate/SubstrateBootstrap.dylib") ||
				fm.fileExists(atPath: "/Application/Cydia.app") ||
				fm.fileExists(atPath: "/usr/sbin/sshd") ||
				fm.fileExists(atPath: "/usr/bin/apt") ||
				fm.fileExists(atPath: "/bin/bash") {
			return true
		} else {
			return false
		}
	}

	private func canOpenCydia() -> Bool {
		let cydia: String = "cydia://"
		guard let cydiaUrlScheme = URL(string: cydia) else { return false }
		if UIApplication.shared.canOpenURL(cydiaUrlScheme) { return true }

		return false
	}

	private var openCydiaApplication: Void {
		let cydia: String = "cydia://"
		guard let cydiaUrlScheme = URL(string: cydia) else { return }
		UIApplication.shared.open(cydiaUrlScheme)
	}
}





struct ContentView_Previews: PreviewProvider {
	static var previews: some View { MainScreenView() }
}
