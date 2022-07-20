//
//  Recipe.swift
//  recipeProject
//
//  Created by Samantha Razon on 7/18/22.
//

import Foundation

// Recipe Response Model
struct  RecipeResponse: Decodable{
    let results : [Recipe]
    
    private enum CodingKeys: String, CodingKey {
        case results = "results"
    }//end CodingKeys
    
}//end RecipeResponse

// -------------------------

// Recipe Model
struct Recipe: Decodable {
    
    let id: Int
    let title: String
    let image: String
    let imageType: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case image = "image"
        case imageType = "imageType"
    }//end CodingKeys
    
}//end Recipe
