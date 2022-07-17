//
//  ContentModel.swift
//  LearningApp
//
//  Created by Iggy Pacanowski on 16/07/2022.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    var styleData: Data?
    
    init() {
        
        getLocalData()
        
    }
    
    
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
        
    }
    

