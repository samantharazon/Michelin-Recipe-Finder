//
//  RecipeDetailsView.swift
//  recipeProject
//
//  Created by Samantha Razon on 7/18/22.
//

import SwiftUI

struct RecipeDetailsView: View {
    
    let recipeID: String
    @StateObject private var recipeDetailsVM = RecipeDetailsViewModel()
  
    var body: some View {
        
            ScrollView{
    
                // recipe image
                AsyncImage(url: recipeDetailsVM.image, content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                }, placeholder: {
                    ProgressView()
                })
                .frame( height: 300)
                
                // recipe title
                Text(recipeDetailsVM.title)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                
                // recipe ready in minutes
                if !String(recipeDetailsVM.readyInMinutes).isEmpty {
                    Text("Ready in " + String(recipeDetailsVM.readyInMinutes) + " minutes")
                        .padding()
                }
                
                // recipe summary
                VStack(alignment: .leading, spacing: 20) {
                    if !recipeDetailsVM.summary.isEmpty {
                        Text("About the Recipe")
                            .font(.headline)
                        
                        Text(recipeDetailsVM.summary)
                    }
                }.padding()
                
                // recipe instructions
                VStack(alignment: .leading, spacing: 20) {
                    if !recipeDetailsVM.instructions.isEmpty {
                        Text("Steps to Make")
                            .font(.headline)
                        
                        Text(recipeDetailsVM.instructions)
                    }
                }.padding()
                
            }//end ScrollView
            .ignoresSafeArea(.container, edges: .top)
            
            .task {
                await recipeDetailsVM.searchDetail(recipeId: recipeID)
            }//end task
        
    }//end body
}//end RecipeDetailsView

struct RecipeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailsView(recipeID: "511728")
    }//end previews
}//end RecipeDetailsView_Previews:
