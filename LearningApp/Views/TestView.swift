//
//  TestView.swift
//  LearningApp
//
//  Created by Iggy Pacanowski on 20/07/2022.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model:ContentModel
    
    @State var buttonColor = Color.white
    @State var submitted = false
    @State var userAnswer:Int?
    @State var userScore = 0
    
    var body: some View {
        VStack {
            
            HStack(alignment:.bottom) {
                Text("Swift Test")
                    .font(.title)
                    .bold()
                Spacer()
                Text("Question \(model.currentQuestionIndex+1) of " + String(model.currentModule?.test.questions.count ?? 0))
                    .font(.caption)
                Spacer()
                Text("Score \(userScore) of " + String(model.currentModule?.test.questions.count ?? 0))
                    .font(.caption)
            }
            
            ZStack {
                CodeTextView(textSource: model.questionDescription)
            }
            
                
                LazyVStack {
                    ForEach(0..<(model.currentQuestion?.answers.count ?? 4), id: \.self) {index in
                        
                        Button {
                            
                            userAnswer = index
                            submitted = true
                            if userAnswer == model.currentQuestion?.correctIndex ?? 0 {
                                buttonColor = Color.green
                                userScore += 1
                            } else {
                                buttonColor = Color.red
                            }
                        } label: {

                            ButtonView(buttonText: String(model.currentQuestion?.answers[index] ?? "Preview Answer"), buttonColor: buttonColor, textColor: Color.black)
                            
                        }
                        //.disabled(submitted)

                        
                            
                    }.offset(y:-100)
                }
                
                
                Spacer()
                    
                    
                    Button {
                        
                        model.nextQuestion()
                        buttonColor = Color.white
                        submitted = false
                        
                    } label: {
                        ButtonView(buttonText: buttonText, buttonColor: Color.green, textColor: Color.white)
                    }
                    //.disabled(!submitted)
            
            
                
            
            
                

            
            

            
        }.padding()
            .navigationBarTitleDisplayMode(.inline)
    }
    
    var buttonText:String {
        
        if model.currentQuestionIndex <= model.currentModule?.test.questions.count ?? 0 {
            return "Next"
        } else {
            return "Finish"
        }
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
            .environmentObject(ContentModel())
            
    }
}
