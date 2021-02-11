//
//  Modifiers.swift
//  RecipeApp
//
//  Created by Muhammed Tanriverdi on 11/02/2021.
//  Copyright © 2021 S3soft. All rights reserved.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.title, design: .default))
            .foregroundColor(Color.gray)
            .padding(8)
    }
}

struct BoxTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.title, design: .default))
    }
}

struct BoxBackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color(UIColor.secondarySystemFill))
            )
    }
}
