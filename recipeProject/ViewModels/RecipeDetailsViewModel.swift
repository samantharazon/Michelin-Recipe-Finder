//
//  RecipeDetailsViewModel.swift
//  recipeProject
//
//  Created by Samantha Razon on 7/18/22.
//

import Foundation


@MainActor
class RecipeDetailsViewModel: ObservableObject {
    
    @Published var recipes: [RecipeInfoModell] = []
    @Published var title: String = ""
    
    // get details of a particular recipe based on recipe id
    func searchDetail(recipeId: String) async {
        do {
            
            let recipes = try await WebServiceDetails().getRecipeDetails(searchTerm: recipeId)

            self.recipes = recipes.map(RecipeInfoModell.init)
            
        } catch {
            print(error)
        }//end do catch
        
    }//end func searchDetail
    
}//end class RecipeDetailsViewModel

struct RecipeInfoModell {

    let recipe: RecipeDetail

    var id: Int{
        recipe.id
    }
    
    var title: String{
        recipe.title
    }
//
//    var readyInMinutes: Int {
//        recipe.readyInMinutes
//    }
//
    var image: URL? {
        URL(string: recipe.image)
    }
//
//    var summary: String {
//        recipe.summary
//    }
//
//    var instructions: String {
//        recipe.instructions
//    }

}//end RecipeInfoModell
