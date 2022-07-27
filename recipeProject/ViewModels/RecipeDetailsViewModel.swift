//
//  RecipeDetailsViewModel.swift
//  recipeProject
//
//  Created by Samantha Razon on 7/18/22.
//

import Foundation

@MainActor
class RecipeDetailsViewModel: ObservableObject {
    
    @Published var title: String = ""
    @Published var image: URL?
    @Published var readyInMinutes: Int = 0
    @Published var summary: String = ""
    @Published var instructions: String = ""
    
    // get details of a particular recipe based on recipe id
    func searchDetail(recipeId: String) async {
        do {
            let recipeDetailResponse = try await WebServiceDetails().getRecipeDetails(searchTerm: recipeId)
            
            self.title = recipeDetailResponse!.title
            self.image = URL(string: recipeDetailResponse!.image)!
            self.readyInMinutes = recipeDetailResponse!.readyInMinutes
           
            let summaryfix = recipeDetailResponse!.summary
            self.summary = summaryfix.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
  
            let instructionsfix = recipeDetailResponse!.instructions
            self.instructions = instructionsfix.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
            
        } catch {
            print(error)
        }//end do catch
        
    }//end func searchDetail
    
}//end class RecipeDetailsViewModel
