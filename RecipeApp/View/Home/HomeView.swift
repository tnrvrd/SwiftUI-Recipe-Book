//
//  HomeView.swift
//  RecipeApp
//
//  Created by mt on 11.05.2020.
//  Copyright © 2020 S3soft. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - PROPERTIES
    
    @EnvironmentObject var recipeListViewModel: RecipeListViewModel
    
    var body: some View {
        
        ZStack (alignment: .bottom) {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    
                    // MARK: - HEADER
                    
                    HeaderView()
                    
                    // MARK: - CATEGORIES
                    
                    if self.recipeListViewModel.dataEditorChoiceIsLoading {
                        ActivityIndicator()
                            .frame(width:30, height: 30)
                            .foregroundColor(.orange)
                            .opacity(self.recipeListViewModel.dataEditorChoiceIsLoading ? 1.0 : 0.0)
                    } else {
                         RecipeRowView(categoryName: "Editor's Choice", recipes: recipeListViewModel.editorRecipesData)
                        
                    }
                    
                    if self.recipeListViewModel.dataTrendingIsLoading {
                        ActivityIndicator()
                           .frame(width:30, height: 30)
                           .foregroundColor(.orange)
                    } else {
                        RecipeRowView(categoryName: "Trending", recipes: recipeListViewModel.trendingRecipesData)
                    }
                    
                    
                    // MARK: - RECIPE CARDS
                    
                    Text("All Recipes")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())
                    
                    VStack(alignment: .center, spacing: 20) {
                        
                        if self.recipeListViewModel.dataIsLoading {
                            ActivityIndicator()
                               .frame(width:30, height: 30)
                               .foregroundColor(.orange)
                        }
                        
                        ForEach(recipeListViewModel.recipeData) { item in
                            RecipeCardView(recipe: item)
                        }
                    }
                    .frame(maxWidth: 640)
                    .padding(.horizontal)
                    .padding(.bottom, 160)
                }
            }
            .edgesIgnoringSafeArea(.all)
            .padding(0)
                
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(RecipeListViewModel())
    }
}
