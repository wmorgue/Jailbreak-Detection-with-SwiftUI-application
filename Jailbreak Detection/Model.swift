//
//  Model.swift
//  Jailbreak Detection
//
//  Created by Nikita Rossik on 8/12/21.
//

import Foundation
import class UIKit.UIApplication


final class Device {
	let bash: String = "/bin/bash"
	let apt: String = "/usr/bin/apt"
	let sshd: String = "/usr/sbin/sshd"
	let cydiaApp: String = "/Application/Cydia.app"
	let substrate: String = "/usr/lib/substrate/SubstrateBootstrap.dylib"
	
	func isJailbroken() -> Bool {
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
	
	func canOpenCydia() -> Bool {
		let cydia: String = "cydia://"
		guard let cydiaUrlScheme = URL(string: cydia) else { return false }
		if UIApplication.shared.canOpenURL(cydiaUrlScheme) { return true }
		
		return false
	}
	
	func openCydiaApplication() -> Void {
		let cydia: String = "cydia://"
		guard let cydiaUrlScheme = URL(string: cydia) else { return }
		UIApplication.shared.open(cydiaUrlScheme)
	}
}
