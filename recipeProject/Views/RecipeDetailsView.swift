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
                // title
                Text(recipeDetailsVM.title)
                
                // image
                AsyncImage(url: recipeDetailsVM.image, content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                }, placeholder: {
                ProgressView()
                })//end AsyncImage Placeholder
                
                // ready in minutes
                Text("Ready in " + String(recipeDetailsVM.readyInMinutes) + " minutes")
                    .padding()
                
                // summary
                HStack {
                    Text(recipeDetailsVM.summary)
        
                }.padding()
                
                // instructions
                HStack {
                    Text(recipeDetailsVM.instructions)
                }.padding()
                
            }//end ScrollView
        
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
