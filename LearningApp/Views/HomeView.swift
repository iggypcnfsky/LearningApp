//
//  ContentView.swift
//  LearningApp
//
//  Created by Iggy Pacanowski on 16/07/2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        
        NavigationView{
            VStack(alignment: .leading) {
                
                Text("What do you want to do today?")
                    .padding(.leading, 20)
                
                ScrollView {
                    LazyVStack {
                        ForEach(model.modules) {module in
                            
                            VStack {
                                
                                NavigationLink {
                                    ContentView()
                                        .onAppear() {
                                            model.beginModule(moduleid: module.id)
                                        }
                                } label: {
                                    //Learing Card
                                    CardPreview(image: module.content.image, category: module.category, description: module.content.description, lessonNumber: module.content.lessons.count, time: module.content.time, context:"learn")
                                }
                                
                                
                                
                                NavigationLink {
                                    //
                                } label: {
                                    //Test Card
                                    CardPreview(image: module.test.image, category: module.category, description: module.test.description, lessonNumber: module.test.questions.count, time: module.test.time, context:"test")
                                }
                                
                                
                                
                                
                                
                                
                                
                                
                            }.padding(.top,10)
                            
                            
                        }
                    } //lV
                    .accentColor(.black)
                    .padding(.horizontal, 10)
                } //sV
                .navigationTitle("Get Started")
                
                
                
            }
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
