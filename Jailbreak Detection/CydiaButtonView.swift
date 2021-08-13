//
//  CydiaButtonView.swift
//  Jailbreak Detection
//
//  Created by Nikita Rossik on 8/12/21.
//

import SwiftUI

struct CydiaButtonView: View {
    var body: some View {
			if Device.canOpenCydia {
				Button("Open Cydia") {
					Device.openCydiaApplication
				}
				.foregroundColor(.primary)
			}
    }
}

struct CydiaButtonView_Previews: PreviewProvider {
    static var previews: some View { CydiaButtonView() }
}
