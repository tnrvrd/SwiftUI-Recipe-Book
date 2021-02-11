//
//  InstructionsView.swift
//  RecipeApp
//
//  Created by mt on 18.05.2020.
//  Copyright © 2020 S3soft. All rights reserved.
//

import SwiftUI

struct InstructionsView: View {
    
    // MARK: - PROPERTIES
    var instructions: [String]
    var recipe: Recipe
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
        
            HStack {
                Spacer()
                Text("Instructions")
                    .modifier(BoxTitleModifier())
                Spacer()
            }
                
            ForEach(recipe.instructions, id: \.self) { item in
                HStack(alignment: .center, spacing: 5) {
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 15, height: 25, alignment: .center)
                        .imageScale(.large)
                        .font(Font.title.weight(.ultraLight))
                        .foregroundColor(Color.gray)
                    
                    Text(item)
                        .lineLimit(nil)
                        .multilineTextAlignment(.leading)
                        .font(.system(.body, design: .default))
                        .fixedSize(horizontal: false, vertical: true)

                }
                .padding(.vertical, 10)
            }
        }
        .modifier(BoxBackgroundModifier())
    }
}

struct InstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsView(instructions: sampleRecipes[0].instructions, recipe: sampleRecipes[1])
    }
}
