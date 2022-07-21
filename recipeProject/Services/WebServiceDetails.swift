//
//  WebService.swift
//  recipeProject
//
//  Created by Samantha Razon on 7/18/22.
//

import Foundation

// Create error
enum NetworkError2: Error {
    case badURL
    case badID
}

// WebService for second url
class WebServiceDetails {

    func getRecipeDetails(searchTerm: String) async throws -> RecipeDetail? {
        
        // Create second url
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.spoonacular.com"
        components.path = "/recipes/" + searchTerm + "/information"
        components.queryItems = [
            URLQueryItem(name: "apiKey", value: "c244520a21634134b45f5a196612cf94"),
        ]
        
        // Get url, Check for error
        guard let url = components.url else {
            throw NetworkError.badURL
        }
        
        // Url Connection
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // Check for 200 response
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError2.badID
        }
        
        // Decode Json and return response
        let RecipeDetailResponse = try? JSONDecoder().decode(RecipeDetail.self, from: data)
        return RecipeDetailResponse
        
        

    }//end getRecipes
}//end WebService
