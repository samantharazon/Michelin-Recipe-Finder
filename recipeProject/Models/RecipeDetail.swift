//
//  Recipe.swift
//  recipeProject
//
//  Created by Samantha Razon on 7/18/22.
//

import Foundation

// Recipe Detail Model
struct RecipeDetail: Decodable{
    
    let id: Int
    let title: String
    let readyInMinutes: Int
    let image: String
    let summary: String
    let instructions: String
}//end RecipeDetail
