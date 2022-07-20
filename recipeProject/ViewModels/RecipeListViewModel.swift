//
//  RecipeListViewModel.swift
//  recipeProject
//
//  Created by Samantha Razon on 7/18/22.
//

import Foundation

@MainActor
class RecipeListViewModel: ObservableObject {
    
    @Published var recipes: [RecipeViewModell] = []
    
    // search for a list of recipes via title
    func search(title: String) async {
        do {
            let recipes = try await WebService().getRecipes(searchTerm: title)
            
            self.recipes = recipes.map(RecipeViewModell.init)
            
        } catch {
            print(error)
        }//end do catch
        
    }//end func search
    
}//end class RecipeListViewModel

// ---------------------

struct RecipeViewModell {
    
    let recipe: Recipe
    
    var id: Int{
        recipe.id
    }
    
    var title: String {
        recipe.title
    }
    
    var image: URL? {
        URL(string: recipe.image)
    }
    
    var imageType: String {
        recipe.imageType
    }
    
}//end RecipeViewModell
