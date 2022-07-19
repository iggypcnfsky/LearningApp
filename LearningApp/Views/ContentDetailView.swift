//
//  LessonView.swift
//  LearningApp
//
//  Created by Iggy Pacanowski on 18/07/2022.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model:ContentModel
    
//    @Binding var navSelectionIndex:Int?
    
    var body: some View {
        
        let videoUrl = URL(string: Constants.videoHostUrl + (model.currentLesson?.video ?? ""))
        
                    
                    VStack {
                        
                        VideoPlayer(player: AVPlayer(url: videoUrl!))
                        .cornerRadius(20)
                            .frame(height: 200)
                        
                        
                        CodeTextView()

                        
                        //show button if there is a next lesson.
                        if model.hasNextLesson() {
                            
                            
                            Button {
                                model.nextLesson()
                            } label: {
                                
                                ButtonView(buttonText: "Next Lesson:  " + (model.currentModule?.content.lessons[model.currentLessonIndex+1].title ?? ""), buttonColor: Color.green, textColor: Color.white)
                                
                            }
                        } else {
                            
                            Button {
                                model.mainNavSelectionIndex = nil
                            } label: {
                                
                                ButtonView(buttonText: "Complete", buttonColor: Color.blue, textColor: Color.white)
                                
                            }
                            
                            
                        }
                    }.padding()
                        .navigationTitle(model.currentLesson?.title ?? "")
                        .navigationBarTitleDisplayMode(.inline)


            
    }
}

//struct LessonView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentDetailView()
//            .environmentObject(ContentModel())
//    }
//}
