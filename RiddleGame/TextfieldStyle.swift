//
//  TextfieldStyle.swift
//  RiddleGame
//
//  Created by Biagio Ricci on 12/04/23.
//

import Foundation
import SwiftUI

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [Color.indigo, Color.black]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
    }
}
