//
//  ContentView.swift
//  recipeProject
//
//  Created by Samantha Razon on 7/18/22.
//

import SwiftUI

struct ContentView: View {
    
    // variables
    @StateObject private var recipeListVM = RecipeListViewModel()
    @State private var searchText: String = ""
    
    var body: some View {
        
        NavigationView {
            
            List(recipeListVM.recipes, id: \.id) { recipe in
                
                //-----------------------------------
                VStack{
                    
                    // recipe title
                    Text(recipe.title)
                        .font(.system(size: 26.0))
                    
                    // navigate to details
                    NavigationLink(destination: RecipeDetailsView(recipeID: String(recipe.id))) {
                       
                        // recipe image 
                        AsyncImage(url: recipe.image, content: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.bottom, 40)

                        }, placeholder: {
                        ProgressView()
                        })//end AsyncImage Placeholder
                        
                    }//end NavigationLink
                    

                }//end VStack
                

                //-----------------------------------
                
            }.listStyle(.plain)
            
                // save user search text
                .searchable(text: $searchText)
            
                // on changing search, perform this
                .onChange(of: searchText) { value in
                    async {
                        if !value.isEmpty && value.count > 3 {
                            await recipeListVM.search(title: value)
                            
                        } else {
                            recipeListVM.recipes.removeAll()
                        }//end if-else
                        
                    }//end async
                    
                }//end onChange
                
                .navigationTitle("Michellin Delish")
                
                .background(
                        Image("showcasefood")
                            .resizable()
                            .scaledToFit()
                        )
            
        }//end NavigationView
        
    
    }//end body
    
}//end ContentView


// --------------------
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }//end previews
}//end ContentView_Previews

// --------------------
