//
//  CodeTextView.swift
//  LearningApp
//
//  Created by Iggy Pacanowski on 19/07/2022.
//

import SwiftUI

struct CodeTextView: UIViewRepresentable {
    
    
    @EnvironmentObject var model:ContentModel
    
    func makeUIView(context: Context) -> UITextView {
        //
        
        let viewText = UITextView()
        viewText.isEditable = false
        
        return viewText
    }
    
    func updateUIView(_ viewText: UITextView, context: Context) {
        //set the attributed text for the lesson
        
        viewText.attributedText = model.lessonDescription
        
        viewText.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
    }

    
}

struct CodeTextView_Previews: PreviewProvider {
    static var previews: some View {
        CodeTextView()
            .environmentObject(ContentModel())
    }
}
