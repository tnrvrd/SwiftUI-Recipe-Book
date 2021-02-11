//
//  Config.swift
//  RecipeApp
//
//  Created by mt on 13.05.2020.
//  Copyright © 2020 S3soft. All rights reserved.
//

import Foundation

// ----------------------------------------------------------------------------------------------

// MARK: Search Feature

// Wait for second while searching to improve the performance
let searchDebounceSecond = 0.5
// Start searching after user enters at least 3 characters
let searchMinimumCharacters = 3

//----------------------------------------------------------------------------------------------

// MARK: -RECIPE DETAIL TEXT
// Unit names below are independent with the database, these unit name are just will be shown the UI side.
// cooking/prep time unit names, you can set empty if you don'w want to show
let unitNamePrep = "min"
let unitNameCooking = "min"
// Nutritional values unit names, you can set empty if you don'w want to show
let unitNameCalories = "kcal"
let unitNameFat = "g"
let unitNameSatfat = "g"
let unitNameCarbs = "g"
let unitNameFiber = "g"
let unitNameSugar = "g"
let unitNameProtein = "g"

