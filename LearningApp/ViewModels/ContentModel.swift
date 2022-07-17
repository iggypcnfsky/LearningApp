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
    
        
    }
    

