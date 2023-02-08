//
//  ContentView.swift
//  PinterestGrid
//
//  Created by 김인환 on 2023/02/08.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var imageSearchService = ImageSearchService.shared
    
    var body: some View {
        
        var gridItems = [GridItem]()
        
        let imageDatas = imageSearchService.imageData.documents
        
        for data in imageDatas {
            gridItems.append(GridItem(height: CGFloat(data.height), title: data.displaySitename ?? "", imageURL: data.imageURL))
        }
        
        return NavigationView {
            ScrollView {
                PinterestGridView(gridItems: gridItems, numberOfColumns: 2, spacing: 20, horizontalPadding: 20)
            }.navigationTitle("추천")
        }.onAppear {
            imageSearchService.fetchImageData(query: "안유진")
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
