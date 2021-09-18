//
//  Model.swift
//  Jailbreak Detection
//
//  Created by Nikita Rossik on 8/12/21.
//

import Foundation
import class UIKit.UIApplication


// More information at:
// https://mobile-security.gitbook.io/mobile-security-testing-guide/ios-testing-guide/0x06j-testing-resiliency-against-reverse-engineering


final class Device {
	let bash: String = "/bin/bash"
	let apt: String = "/usr/bin/apt"
	let sshd: String = "/usr/sbin/sshd"
	let cydiaApp: String = "/Application/Cydia.app"
	let substrate: String = "/usr/lib/substrate/SubstrateBootstrap.dylib"
	
	func isJailbroken() -> Bool {
		
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
	
	func canOpenCydia(_ input: String = "cydia://") -> Bool {
		guard let cydiaUrlScheme = URL(string: input) else { return false }
		if UIApplication.shared.canOpenURL(cydiaUrlScheme) { return true }
		
		return false
	}
	
	func openCydiaApplication(_ input: String = "cydia://") -> Void {
		guard let cydiaUrlScheme = URL(string: input) else { return }
		UIApplication.shared.open(cydiaUrlScheme)
	}
}
