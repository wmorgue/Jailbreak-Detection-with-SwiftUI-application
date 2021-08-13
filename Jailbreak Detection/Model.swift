//
//  Model.swift
//  Jailbreak Detection
//
//  Created by Nikita Rossik on 8/12/21.
//

import Foundation
import class UIKit.UIApplication


final class Device {
	static let bash: String = "/bin/bash"
	static let apt: String = "/usr/bin/apt"
	static let sshd: String = "/usr/sbin/sshd"
	static let cydiaApp: String = "/Application/Cydia.app"
	static let substrate: String = "/usr/lib/substrate/SubstrateBootstrap.dylib"

	static func isJailbroken() -> Bool {
		#if targetEnvironment(simulator)
		return false
		#endif

		let fm: FileManager = .default

		if fm.fileExists(atPath: substrate) ||
				fm.fileExists(atPath: cydiaApp) ||
				fm.fileExists(atPath: sshd) 		||
				fm.fileExists(atPath: apt) 			||
				fm.fileExists(atPath: bash) {
			return true
		} else {
			return false
		}
	}

	static var canOpenCydia: Bool {
		let cydia: String = "cydia://"
		guard let cydiaUrlScheme = URL(string: cydia) else { return false }
		if UIApplication.shared.canOpenURL(cydiaUrlScheme) { return true }

		return false
	}

	static var openCydiaApplication: Void {
		let cydia: String = "cydia://"
		guard let cydiaUrlScheme = URL(string: cydia) else { return }
		UIApplication.shared.open(cydiaUrlScheme)
	}
}
