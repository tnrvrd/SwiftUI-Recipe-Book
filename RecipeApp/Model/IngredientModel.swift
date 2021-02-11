//
//  IngredientModel.swift
//  RecipeApp
//
//  Created by mt on 13.05.2020.
//  Copyright © 2020 S3soft. All rights reserved.
//

import Foundation

struct Ingredient:Identifiable, Codable, Equatable {
    var id = UUID()
    var title: String
    var items: [IngredientItem]
}

struct IngredientItem:Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var done: Bool
}
