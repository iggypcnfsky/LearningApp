//
//  ContentModel.swift
//  LearningApp
//
//  Created by Iggy Pacanowski on 16/07/2022.
//

import Foundation

class ContentModel: ObservableObject {
    
    
    
    //List of modules
    @Published var modules = [Module]()
    
    
    //Current module(state of things)
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    //Current lesson(state of things)
    @Published var currentLesson: Lesson?
    var currentLessonIndex = 0
    
    
    //Current lesson explanation
    @Published var lessonDescription = NSAttributedString()
    
    //Current question explanation
    @Published var questionDescription = NSAttributedString()
    
    //State of the navigationLink Selection
    @Published var mainNavSelectionIndex:Int?
    
    
    //State of test questions
    @Published var currentQuestion: Question?
    var currentQuestionIndex = 0
    
    
    
    var styleData: Data?
    
    init() {
        
        getLocalData()
        
    }
    
    // MARK: DATA METHODS
    
    func getLocalData() {
        
        //Get a URL path to JSON file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        //Create a data object
        do {
            let jsonData = try Data(contentsOf: jsonUrl!)
            let decoder = JSONDecoder()
            let moduleData = try decoder.decode([Module].self, from: jsonData)
            self.modules = moduleData
            
        } catch {
            print(error)
        }
        
        
        
        
        //parse the style data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            
            let styleData = try Data(contentsOf: styleUrl!)
            
            self.styleData = styleData
            
        } catch {
            //log error
        }
        
        
    }
    
    
    // MARK: MODULE NAVIGATION METHODS
    
    func beginModule(moduleid:Int) {
        
        //find the index for this module id
        for index in 0..<modules.count {
            if modules[index].id == moduleid {
                //Found the matching module
                currentModuleIndex = index
                break
            }
        }
        
        //set the current module
        currentModule = modules[currentModuleIndex]
    }
    
    
    
    // MARK: LESSON NAVIGATION METHODS
    
    func beginLesson(lessonid:Int, modelid:Int) {
        //find the index for this module id
        for index in 0..<modules[modelid].content.lessons.count {
            if modules[modelid].content.lessons[index].id == lessonid {
                //Found the matching module
                currentLessonIndex = index
                break
            }
        }
        
        //set the current module
        currentLesson = modules[modelid].content.lessons[currentLessonIndex]
        lessonDescription = addStyling(currentLesson!.explanation)
    }
    
    
    func beginQuestion(questionid:Int) {
        
        for index in 0..<currentModule!.test.questions.count {
            if currentModule?.test.questions[index].id == questionid {
                currentQuestionIndex = index
                break
            }
        }
        
        currentQuestion = currentModule?.test.questions[currentQuestionIndex]
        //add styling to the HTML rich text.
        questionDescription = addStyling(currentQuestion!.content)
        
    }
    
        
    
    func hasNextLesson() -> Bool {
        
        if currentLessonIndex + 1 < currentModule?.content.lessons.count ?? 0 {
            return true
        } else {
            return false
        }
        
    }
    
    func hasNextQuestion() -> Bool {
        if currentQuestionIndex + 1 < currentModule?.test.questions.count ?? 0 {
            return true
        } else {
            return false
        }
    }
    
    
    func nextLesson() {
        
        //advance lesson
        currentLessonIndex += 1
        
        
        //check if lesson is in range
        if currentLessonIndex < currentModule?.content.lessons.count ?? 0 {
            
            //set current lesson to new lesson
            currentLesson = currentModule?.content.lessons[currentLessonIndex]
            lessonDescription = addStyling(currentLesson!.explanation)
            
        } else {
            currentLesson = nil
            currentLessonIndex = 0
        }
        
        
    }
    
    
    func nextQuestion() {
        //advance question
        currentQuestionIndex += 1
        
        //check if question is in range
        if currentQuestionIndex < currentModule?.test.questions.count ?? 0 {
            //set current question to new question
            currentQuestion = currentModule?.test.questions[currentQuestionIndex]
            
            //add styling to the HTML rich text.
            questionDescription = addStyling(currentQuestion!.content)
        } else {
            currentQuestion = nil
            currentQuestionIndex = 0
            mainNavSelectionIndex = nil
        }
    }
    
    
    private func addStyling(_ htmlString:String) -> NSAttributedString {
     
        
        var resultString = NSAttributedString()
        
        var data = Data()
        
        //Add the styling data
        if styleData != nil {
            data.append(self.styleData!)
        }
        
        
        //Add the html data
        data.append(Data(htmlString.utf8))
        
        //Convert to attributed String
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            resultString = attributedString
        }
        
        
        return resultString
        
    }
    
    
    }
    

