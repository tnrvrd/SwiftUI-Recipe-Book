//
//  RecipeCardView.swift
//  RecipeApp
//
//  Created by mt on 11.05.2020.
//  Copyright © 2020 S3soft. All rights reserved.
//

import SwiftUI

struct RecipeCardView: View {
    
    // MAKR: PROPERTIES
    var recipe: Recipe
    @State private var showModal: Bool = false
    @EnvironmentObject var favoriteViewModel: FavoriteViewModel
    @EnvironmentObject var shoppingListViewModel: ShoppingListViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            ImageLoaderView(imageUrl: recipe.image)
            
            VStack(alignment: .leading, spacing: 12) {
                // TITLE
                Text(recipe.title)
                    .font(.system(.headline, design: .default))
                
                // RATES
                RecipeRatingView(recipe: recipe)
                
                // COOKING
                RecipeCookingView(recipe: recipe)
                
            }
            .padding()
            .padding(.bottom, 12)
                
        }
        .background(Color("ColorBackgroundAdaptive"))
        .cornerRadius(12)
        .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 0)
        .onTapGesture {
            self.showModal = true
        }
        .sheet(isPresented: self.$showModal) {
            RecipeDetailView(recipe: self.recipe)
                .environmentObject(self.favoriteViewModel)
                .environmentObject(RecipeViewModel(recipe: self.recipe))
                .environmentObject(self.shoppingListViewModel)
        }   
    }
}

struct RecipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            RecipeCardView(recipe: sampleRecipes[0])
                    .previewLayout(.sizeThatFits)
                    .colorScheme(.light)
                
                RecipeCardView(recipe: sampleRecipes[0])
                    .previewLayout(.sizeThatFits)
                    .colorScheme(.dark)
        }
    }
}
