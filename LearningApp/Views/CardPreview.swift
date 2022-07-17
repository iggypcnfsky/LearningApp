//
//  CardPreview.swift
//  LearningApp
//
//  Created by Iggy Pacanowski on 17/07/2022.
//

import SwiftUI

struct CardPreview: View {
    
    var image:String
    var category:String
    var description:String
    var lessonNumber:Int
    var time:String
    var context:String
    
    var body: some View {
        
        
        ZStack {
            
            Rectangle().foregroundColor(.white)
                .cornerRadius(15)
                .shadow(radius: 5)
                
                
            
            HStack {
                
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 100, height: 100)
                    .padding()
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Spacer()
                    
                    if context == "learn" {
                        Text("Learn \(category)")
                            .bold()
                    } else {
                        Text("Test \(category)")
                            .bold()
                    }
                    
                    Text(description)
                        .padding(.bottom, 20)
                        .font(.system(size: 10))
                        .fixedSize(horizontal: false, vertical: true)
                        
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "text.book.closed")
                        if context == "learn" {
                            Text("\(lessonNumber) lessons")
                                .font(.system(size: 10))
                        } else {
                            Text("\(lessonNumber) questions")
                                .font(.system(size: 10))
                        }
                        
                        Spacer()
                        Image(systemName: "clock")
                        Text(time)
                            .font(.system(size: 10))

                        
                    } //H
                    .font(.footnote)
                    
                    Spacer()
                    
                } //V
                
                
            } //H
            .padding()
            
        } //Z
        .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
        
    }
}

struct CardPreview_Previews: PreviewProvider {
    static var previews: some View {
        let model = ContentModel()
        CardPreview(image: model.modules[0].test.image, category: model.modules[0].category, description: model.modules[0].test.description, lessonNumber: model.modules[0].test.questions.count, time: model.modules[0].test.time, context:"test")
            .previewLayout(.sizeThatFits)
    }
}
