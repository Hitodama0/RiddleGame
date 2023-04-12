//
//  ContentView.swift
//  RiddleGame
//
//  Created by Biagio Ricci on 12/04/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    @State private var correct = false
    @State private var score = 0
    @State private var userInput = ""
    @State private var text = ""
    @State private var Answerd = [String]()
    @State private var solution = false
    var body: some View {
        VStack {
            
            HStack {
                Button("New Riddle") {
                    viewModel.fetch()
                    text = ""
                    userInput = ""
                }
                .buttonStyle(GrowingButton())
                
                Spacer()
                
                Button {
                    reset()
                } label: {
                    HStack{
                        Text("Reset")
                        Image(systemName: "eraser.fill")
                    }
                }
                .buttonStyle(GrowingButton())
            }
            .padding()
            
            Text("Score: \(score)")
                .foregroundColor(.teal)
                .bold()
            
            
            if let riddle = viewModel.riddle {
                Text("Riddle:")
                    .padding()
                Text(riddle.riddle)
                    .bold()
            }
            
            Text(text)
                .foregroundColor(correct ? .green : .red)
            
            TextField("Enter answer", text: $userInput)
                .padding()
                .textFieldStyle(OvalTextFieldStyle())
            
            Button("Show Solution") {
                solution.toggle()
            }
            .buttonStyle(GrowingButton())
            .disabled(text == "" || text == "Correct")
            
            .sheet(isPresented: $solution) {
                if let solution = viewModel.riddle?.answer {
                    SolutionView(solution: solution)
                }
            }
            
            List {
                ForEach(Answerd, id: \.self) {
                    answer in HStack {
                        Image(systemName: "\(answer.count).circle")
                        Text(answer)
                    }
                }
            }
            .padding()
        }
        .onAppear {
            viewModel.fetch()
        }
        .onSubmit(game)
        .padding()
        .preferredColorScheme(.dark)
    }
    func game() {
        if userInput == viewModel.riddle?.answer {
            
            withAnimation {
                Answerd.insert(userInput, at: 0)
            }
            correct = true
            text = "CORRECT"
            
            score += userInput.count
        }
        else {
            correct = false
            text = "WRONG"
        }
    }
    
    func reset() {
        score = 0
        userInput = ""
        text = ""
        Answerd = []
        viewModel.fetch()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
