//
//  WebService.swift
//  recipeProject
//
//  Created by Samantha Razon on 7/18/22.
//

import Foundation

// Create error
enum NetworkError: Error {
    case badURL
    case badID
}//end NetworkError

// WebService for first url
class WebService {

    func getRecipes(searchTerm: String) async throws -> [Recipe] {
        
        // Create first url
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.spoonacular.com"
        components.path = "/recipes/complexSearch"
        components.queryItems = [
            URLQueryItem(name: "query", value: searchTerm),
            URLQueryItem(name: "apiKey", value: "c9eeac5d8d9d4e88babb5fa7d083d911")
        ]
        
        // Get url, Check for error
        guard let url = components.url else {
            throw NetworkError.badURL
        }
        
        // Url Connection
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // Check for 200 response
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.badID
        }
        
        // Decode Json and return response
        let recipeResponse = try? JSONDecoder().decode(RecipeResponse.self, from: data)
        return recipeResponse?.results ?? []

    }//end getRecipes
    
}//end WebService
