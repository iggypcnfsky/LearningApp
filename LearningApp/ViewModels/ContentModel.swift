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
    }
    
        
    
    func hasNextLesson() -> Bool {
        
        if currentLessonIndex + 1 < currentModule?.content.lessons.count ?? 0 {
            return true
        } else {
            return false
        }
        
        return false
        
    }
    
    
    func nextLesson() {
        
        //advance lesson
        currentLessonIndex += 1
        
        
        //check if lesson is in range
        if currentLessonIndex < currentModule?.content.lessons.count ?? 0 {
            
            //set current lesson to new lesson
            currentLesson = currentModule?.content.lessons[currentLessonIndex]
            
        } else {
            currentLesson = nil
            currentLessonIndex = 0
        }
        
        
    }
    
    
    }
    

