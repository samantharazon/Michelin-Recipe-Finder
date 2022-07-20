//
//  Recipe.swift
//  recipeProject
//
//  Created by Samantha Razon on 7/18/22.
//

import Foundation

// Recipe Detail Response Model
struct RecipeDetailResponse: Decodable{
    let recipes: [RecipeDetail]

    private enum CodingKeys: String, CodingKey {
        case recipes = ""
    }//end CodingKeys
    
}//end RecipeDetailResponse

// -------------------------

// Recipe Model

struct RecipeDetail: Decodable{
    
    let id: Int
    let title: String
//    let readyInMinutes: Int
    let image: String
//    let summary: String
//    let instructions: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case image = "image"
    }//end CodingKeys
    
}//end RecipeDetail
