//
//  ImageLoaderView.swift
//  RecipeApp
//
//  Created by mt on 19.05.2020.
//  Copyright © 2020 S3soft. All rights reserved.
//

import SwiftUI

struct ImageLoaderView: View {
    // MARK: - PROPERTIES
    var imageUrl: String
    
    var body: some View {
        Image(imageUrl)
            .resizable()
            .scaledToFill()
    }
}

struct ImageLoaderView_Previews: PreviewProvider {
    static var previews: some View {
        ImageLoaderView(imageUrl: "https://s3soft.com/wp-content/uploads/2020/03/logo-1.png")
    }
}
