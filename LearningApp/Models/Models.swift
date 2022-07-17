//
//  Module.swift
//  LearningApp
//
//  Created by Iggy Pacanowski on 17/07/2022.
//

import Foundation


struct Module: Decodable, Identifiable {
    
    var id:Int
    var category:String
    var content:LessonContent
    var test:TestContent
    
}


struct LessonContent: Decodable, Identifiable {
    
    var id:Int
    var image:String
    var time:String
    var description:String
    var lessons:[Lesson]
    
}


struct Lesson: Decodable, Identifiable {
    
    var id:Int
    var title:String
    var video:String
    var duration:String
    var explanation:String
    
}


struct TestContent: Decodable, Identifiable {
    
    var id:Int
    var image:String
    var time:String
    var description:String
    var questions:[Question]
    
}


struct Question: Decodable, Identifiable {
    
    var id:Int
    var content:String
    var correctIndex:Int
    var answers:[String]
    
}
