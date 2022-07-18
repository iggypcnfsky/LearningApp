//
//  LearningList.swift
//  LearningApp
//
//  Created by Iggy Pacanowski on 17/07/2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                LazyVStack(spacing: 15) {
                    
                    if model.currentModule != nil {
                        
                        ForEach(model.currentModule!.content.lessons) {lesson in
                            //Row
                            
                            NavigationLink {
                                ContentDetailView()
                                    .onAppear() {
                                        model.beginLesson(lessonid: lesson.id, modelid: model.currentModule?.id ?? 0)
                                    }
                            } label: {
                                ZStack{
                                    Rectangle().foregroundColor(.white)
                                        .cornerRadius(15)
                                        .shadow(radius: 5)
                                    HStack{
                                        Text(String(lesson.id + 1))
                                            .bold()
                                            .padding()
                                        VStack(alignment: .leading, spacing: 3){
                                            Text(lesson.title)
                                                .bold()
                                            Text(lesson.duration)
                                                .font(.caption)
                                        }
                                        Spacer()
                                    }.padding(.horizontal, 10)
                                        .padding(.vertical, 5)
                                }
                            }

                            
                        }
                        
                    }
                    
                    
                }.padding(.horizontal, 10)
                    
            } //ScrlView
            .navigationTitle("Learn \(model.currentModule?.category ?? "")")
            .accentColor(.black)
            
            
        }
        .onAppear() {
            model.beginModule(moduleid: 0)
        }
        //.navigationViewStyle(.stack)
        

    }
}

struct LearningList_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ContentModel())
            
    }
}
