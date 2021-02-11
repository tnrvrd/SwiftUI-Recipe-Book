//
//  CheckboxView.swift
//  RecipeApp
//
//  Created by mt on 13.05.2020.
//  Copyright © 2020 S3soft. All rights reserved.
//

import SwiftUI

struct CheckboxView: View {
    let id: UUID
    let label: String
    let done: Bool
    let imageSize: CGFloat
    let color: Color
    let textSize: CGFloat
    let callback: (UUID, Bool)->()
    
    @State var isMarked:Bool
    
    init(
        id: UUID,
        label:String,
        done:Bool,
        imageSize: CGFloat = 14,
        color: Color = Color.black,
        textSize: CGFloat = 14,
        callback: @escaping (UUID, Bool)->()
        ) {
        self.id = id
        self.label = label
        self.done = done
        self.imageSize = imageSize
        self.color = color
        self.textSize = textSize
        self.callback = callback
        
        _isMarked = State(initialValue: done)
    }
    
    
    var body: some View {
        Button(action:{
            self.isMarked.toggle()
            self.callback(self.id, self.isMarked)
        }) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: self.isMarked ? "checkmark.circle" : "circle")
                    .resizable()
                    .foregroundColor(self.isMarked ? Color.gray : Color.primary)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.imageSize, height: self.imageSize)
                
                Text(label)
                    .font(Font.system(size: textSize))
                    .foregroundColor(self.isMarked ? Color.gray : Color.primary)
                    .multilineTextAlignment(TextAlignment.leading)
                    .lineLimit(nil)
                Spacer()
            }
            .foregroundColor(self.color)
            .padding(5)
        }
        .foregroundColor(Color.white)
    }
}

func testCheckboxSelected(id: UUID, isMarked: Bool) {
    
}

struct CheckboxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxView(
            id: UUID(),
            label: "Ingredient Item",
            done: true,
            imageSize: 18,
            textSize: 14,
            callback: testCheckboxSelected
        )
        .previewLayout(.sizeThatFits)
    }
}
