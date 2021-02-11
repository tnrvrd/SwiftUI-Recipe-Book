//
//  RecipeRowView.swift
//  RecipeApp
//
//  Created by mt on 11.05.2020.
//  Copyright © 2020 S3soft. All rights reserved.
//

import SwiftUI

struct RecipeRowView: View {
    
    // MARK: - PROPERTIEIS
    var categoryName: String
    var recipes: [Recipe]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.recipes) { item in
                        RecipeItem(recipe: item)
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct RecipeItem: View {
    
    // MARK: - PROPERTIEIS
    var recipe: Recipe
    @State private var showModal: Bool = false
    
    @EnvironmentObject var favoriteViewModel: FavoriteViewModel
    @EnvironmentObject var shoppingListViewModel: ShoppingListViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottom) {
                ImageLoaderView(imageUrl: recipe.image)
                    .frame(width: 155, height: 155, alignment: .center)
                    
                HStack {
                    Image(systemName: "person.2")
                        .foregroundColor(Color.white)
                        .font(.callout)
                        .padding(.leading, 5)
                    
                    
                    Text("\(recipe.serves)")
                        .foregroundColor(Color.white)
                        .font(.callout)
                    
                    Spacer()
                    
                    Text("\(recipe.preparation) min")
                        .foregroundColor(Color.white)
                        .font(.callout)
                        .padding(.trailing, 5)
                }
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .top, endPoint: .bottom)
                        .padding(.top, -20)
                )
                
            }
            .cornerRadius(5)
            
            Text(recipe.title)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
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

struct RecipeRowView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRowView(categoryName:"Trending", recipes: sampleRecipes)
    }
}
