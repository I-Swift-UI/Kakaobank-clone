//
//  URLImage.swift
//  PinterestGrid
//
//  Created by 김인환 on 2023/02/08.
//

import SwiftUI

struct URLImage: View {
    
    @StateObject private var imageLoader = URLImageLoader()
    
    private let urlString: String?
    
    init(urlString: String?) {
        self.urlString = urlString
    }
    
    private var content: some View {
        Group {
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                ProgressView()
                    .padding()
            }
        }
    }
    
    var body: some View {
        content
            .onAppear {
                imageLoader.fetch(urlString: urlString)
            }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(urlString: "https://s3.avatarapi.com/7b18eb6f263b1efb30f1dbb7f7c9a7accdebfbd710cc45d922d0c0dd48746876.gif")
    }
}
