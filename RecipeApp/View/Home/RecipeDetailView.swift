//
//  RecipeDetailView.swift
//  RecipeApp
//
//  Created by mt on 11.05.2020.
//  Copyright © 2020 S3soft. All rights reserved.
//

import SwiftUI

struct RecipeDetailView: View {
    // MARK: - PROPERTIES
    var recipe: Recipe
    @State private var showAlertAddFavorite: Bool = false

    @EnvironmentObject var favoriteViewModel: FavoriteViewModel
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack (alignment: .center, spacing: 0) {
                // IMAGE
                ZStack(alignment: .bottom) {
                    
                    ImageLoaderView(imageUrl: recipe.image)
                        .scaledToFit()
                    
                    HStack {
                        Spacer()
                         
                        Button(action: {
                            if self.recipeViewModel.favorite {
                                self.favoriteViewModel.removeRecipeFromFavorites(recipe: self.recipe)
                                self.recipeViewModel.setFavorite(flag: false)
                            } else {
                                self.favoriteViewModel.addRecipeToFavorites(recipe: self.recipe)
                                self.recipeViewModel.setFavorite(flag: true)
                                self.showAlertAddFavorite.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    self.showAlertAddFavorite.toggle()
                                }
                            }

                        }) {
                            Image(systemName: recipeViewModel.favorite ? "bookmark.fill" : "bookmark")
                                .font(.system(size:30, weight: .light))
                                .foregroundColor(Color.white)
                                .shadow(color: Color.gray, radius: 2, x: 0, y: 0)
                                .padding(20)
                        }
                        .alert(isPresented: $showAlertAddFavorite) {
                            Alert(
                                title: Text("Successful"),
                                message: Text("Recipe was added to favorites list."),
                                dismissButton: .default(Text("Ok")))
                        }
                    }
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .top, endPoint: .bottom)
                    )
                    
                }
                
                
                Group {
                    // TITLE
                    Text(recipe.title)
                        .font(.system(.title, design: .default))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.top, 10)
                        
                    // HEADING
                    RecipeRatingView(recipe: recipe)
                    
                    // COOKING
                    RecipeCookingView(recipe: recipe)
                    
                    // INGREDIENTS
                    RecipeIngredientsView(recipe: recipe)

                    // NUTRITIONAL VALUES
                    NutritionalView(recipe: recipe)
                                       
                    // INSTRUCTIONS
                    InstructionsView(instructions: recipe.instructions, recipe: recipe)
                    
                    // Comment
                    if recipe.comments.count > 0 {
                        VStack(alignment: .leading, spacing: 10) {
                        
                            HStack {
                                Spacer()
                                Text("Comment")
                                    .modifier(BoxTitleModifier())
                                Spacer()
                            }
                            
                            Text(recipe.comments)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                         .modifier(BoxBackgroundModifier())
                    }
                    
                    
                }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 12)
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}


struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: sampleRecipes[0])
            .environmentObject(FavoriteViewModel())
            .environmentObject(ShoppingListViewModel())
    }
}
