//
//  CydiaButtonView.swift
//  Jailbreak Detection
//
//  Created by Nikita Rossik on 8/12/21.
//

import SwiftUI

struct CydiaButtonView: View {
	let model: Device
	private let radius: CGFloat = 20
	
	var body: some View {
		Button(model.canOpenCydia() ? "Open Cydia" : "Can't open Cydia") {
			model.openCydiaApplication()
		}
		.padding()
		.background(Color.init(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
		.clipShape(RoundedRectangle(cornerRadius: radius))
		.foregroundColor(.primary)
	}
	
	internal init(_ model: Device) {
		self.model = model
	}
	
}

struct CydiaButtonView_Previews: PreviewProvider {
	static var previews: some View { CydiaButtonView(Device()) }
}
