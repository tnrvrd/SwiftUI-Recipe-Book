//
//  NutritionalItemView.swift
//  RecipeApp
//
//  Created by mt on 18.05.2020.
//  Copyright © 2020 S3soft. All rights reserved.
//

import SwiftUI

struct NutritionalItemView: View {
    
    // MARK: - PROPERTIES
    var value: Int
    var name: String
    var unitName: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 2) {
            Text("\(value)\(unitName)")
                .foregroundColor(Color(UIColor.systemYellow))
                .font(.system(.headline))
            Text(name)
                .font(.system(.caption))
        }
        .frame(width:70, height: 70)
        .background(
            Circle()
                .fill(Color(UIColor.systemBackground))
                .frame(width:60, height: 60)
            )
        .background(
            Circle()
                .fill(Color(UIColor.systemGray))
                .frame(width:63, height: 63)
            )
    }
}

struct NutritionalItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NutritionalItemView(value: 123, name: "Calories", unitName: "g").colorScheme(.light)
                .previewLayout(.sizeThatFits)
            NutritionalItemView(value: 78, name: "Calories", unitName: "g").colorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
    }
}
