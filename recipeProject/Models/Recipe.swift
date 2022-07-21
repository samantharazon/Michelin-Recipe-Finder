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
}//end RecipeResponse

// -------------------------

// Recipe Model
struct Recipe: Decodable {
    
    let id: Int
    let title: String
    let image: String
}//end Recipe
