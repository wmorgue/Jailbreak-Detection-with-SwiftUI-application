//
//  MainScreenView.swift
//  Jailbreak Detection
//
//  Created by Nikita Rossik on 8/12/21.
//

import SwiftUI

struct MainScreenView: View {
	var body: some View {
		Text(mainText).padding()
		CydiaButtonView()
	}
}



extension MainScreenView {
	private var mainText: String {
		switch Device.isJailbroken() {
			case true: return "Device is Jailbroken"
			case false: return "Not a Jailbroken"
		}
	}
}





struct ContentView_Previews: PreviewProvider {
	static var previews: some View { MainScreenView() }
}
