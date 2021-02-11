//
//  ShoppingIngredientsView.swift
//  RecipeApp
//
//  Created by mt on 14.05.2020.
//  Copyright © 2020 S3soft. All rights reserved.
//

import SwiftUI

struct ShoppingIngredientsView: View {
    // MARK: - PROPERTIES
    var ingredient: Ingredient
    var hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    @State var showPopover = false
    
    @EnvironmentObject var shoppingListViewModel: ShoppingListViewModel
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
            
            HStack(alignment: .center, spacing: 10) {
                Text(ingredient.title)
                
                Spacer()
                
                Button(action: {
                    
                    if let index = self.shoppingListViewModel.shoppingList.firstIndex(where: { $0.id == self.ingredient.id }) {
                        self.shoppingListViewModel.removeRecipeFromShoppingList(ingredientIndex: index)
                    }
                    
                }) {
                    Image(systemName: "trash.circle")
                        .imageScale(.large)
                        .foregroundColor(Color.red)
                }
                
            }
            
            VStack(alignment: .center, spacing: 10) {
                ForEach(ingredient.items) { item in
                    CheckboxView(
                        id: item.id,
                        label: item.name,
                        done: item.done,
                        imageSize: 18,
                        textSize: 14,
                        callback: self.checkboxSelected
                    )
                }
            }
        }
        .padding(.horizontal)
    }
    
    func checkboxSelected(id: UUID, isMarked: Bool) {
        hapticImpact.impactOccurred()
        
        if let index = shoppingListViewModel.shoppingList.firstIndex(where: { $0.id == ingredient.id }) {
            shoppingListViewModel.setDoneOfIngredientItem(ingredientIndex: index, ingredientItemId: id, done: isMarked)
        }
    }
}

struct ShoppingIngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingIngredientsView(ingredient: Ingredient(title: "Pizza", items: [IngredientItem(name: "Salt", done: true), IngredientItem(name: "Milk", done: false)]))
            .environmentObject(ShoppingListViewModel())
            .previewLayout(.sizeThatFits)
    }
}
