//
//  SolutionView.swift
//  RiddleGame
//
//  Created by Biagio Ricci on 12/04/23.
//

import SwiftUI



struct SolutionView: View {
    var solution: String
    var body: some View {
        Text("The solution is: ")
        Text(solution)
            .font(.headline)
            .bold()
            .foregroundColor(.teal)
            .padding()
    }
}

/*struct SolutionView_Previews: PreviewProvider {
 static var previews: some View {
 SolutionView()
 }
 }*/
