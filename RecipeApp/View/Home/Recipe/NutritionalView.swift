//
//  NutritionalView.swift
//  RecipeApp
//
//  Created by mt on 18.05.2020.
//  Copyright © 2020 S3soft. All rights reserved.
//

import SwiftUI

struct NutritionalView: View {
    
    // MARK: - PROPERTIES
    var recipe: Recipe
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 10) {
            
            HStack {
                Spacer()
                Text("Nutritional Values")
                    .modifier(BoxTitleModifier())
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 10) {
               HStack(alignment: .center, spacing: 10) {
                    NutritionalItemView(value: recipe.calories, name: unitNameCalories, unitName:"")
                    NutritionalItemView(value: recipe.fat, name: "fat", unitName:unitNameFat)
                    NutritionalItemView(value: recipe.satfat, name: "satfat", unitName:unitNameSatfat)
                    NutritionalItemView(value: recipe.carbs, name: "carbs", unitName:unitNameCarbs)
               }
               HStack(alignment: .center, spacing: 10) {
                    NutritionalItemView(value: recipe.fiber, name: "fiber", unitName:unitNameFiber)
                    NutritionalItemView(value: recipe.sugar, name: "sugar", unitName:unitNameSugar)
                    NutritionalItemView(value: recipe.protein, name: "protein", unitName:unitNameProtein)
               }
            }
        }
        .modifier(BoxBackgroundModifier())
        
    }
}

struct NutritionalView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NutritionalView(recipe: sampleRecipes[0]).colorScheme(.light)
            NutritionalView(recipe: sampleRecipes[0]).colorScheme(.dark)
        }
    }
}
