//
//  ShoppingListViewModel.swift
//  RecipeApp
//
//  Created by mt on 14.05.2020.
//  Copyright © 2020 S3soft. All rights reserved.
//

import SwiftUI

final class ShoppingListViewModel: ObservableObject {
    
    @Published var shoppingList: [Ingredient] = []
    
    let defaults = UserDefaults.standard
    
    init() {
        let data = defaults.data(forKey: keyShoppingList)
        if (data != nil) {
            shoppingList = try! JSONDecoder().decode([Ingredient].self, from: data!)
        }
    }
}

extension ShoppingListViewModel {
    
    func addRecipeToShoppingList(recipe: Recipe) {
        
        var ingredientItemList: [IngredientItem] = []
        for item in recipe.ingredients {
            ingredientItemList.append(IngredientItem(name: item, done: false))
        }
        
        shoppingList.append(Ingredient(title: recipe.title, items: ingredientItemList))
        saveShoppingList()
    }
    
    func removeRecipeFromShoppingList(ingredientIndex: Int) {
        shoppingList.remove(at: ingredientIndex)
        saveShoppingList()
    }
    
    private func saveShoppingList() {
        let data = try! JSONEncoder().encode(shoppingList)
        defaults.set(data, forKey: keyShoppingList)
    }
    
    func setDoneOfIngredientItem(ingredientIndex: Int, ingredientItemId: UUID, done: Bool) {
        
        if let ingredientItem = shoppingList[ingredientIndex].items.first(where: {$0.id == ingredientItemId}) {
             if let itemIndex = shoppingList[ingredientIndex].items.firstIndex(where: { $0.id == ingredientItem.id }) {
                 shoppingList[ingredientIndex].items[itemIndex].done = done
                 
                 saveShoppingList()
             }
        }
        
    }
}

