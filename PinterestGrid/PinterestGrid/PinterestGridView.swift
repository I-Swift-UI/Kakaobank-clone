//
//  PinterestGridView.swift
//  PinterestGrid
//
//  Created by 김인환 on 2023/02/08.
//

import SwiftUI

struct GridItem: Identifiable {
    let id = UUID()
    let height: CGFloat
    let title: String
    let imageURL: String
}

struct PinterestGridView: View {
    
    struct Column: Identifiable {
        let id = UUID()
        var gridItems = [GridItem]()
    }
    
    let columns: [Column]
    
    init(gridItems: [GridItem], numberOfColumns: Int, spacing: CGFloat = 20, horizontalPadding: CGFloat = 20) {
        self.spacing = spacing
        self.horizontalPadding = horizontalPadding
        
        var columns = [Column]()
        
        for _ in 0..<numberOfColumns {
            columns.append(Column())
        }
        
        for _ in 0..<numberOfColumns {
            var columnsHeight = Array<CGFloat>(repeating: 0, count: numberOfColumns)
            for gridItem in gridItems {
                var smallestColumnIndex = 0
                var smallestHeight = columnsHeight.first!
                
                for i in 1..<columnsHeight.count {
                    let curHeight = columnsHeight[i]
                    if curHeight < smallestHeight {
                        smallestHeight = curHeight
                        smallestColumnIndex = i
                    }
                }
                
                columns[smallestColumnIndex].gridItems.append(gridItem)
                columnsHeight[smallestColumnIndex] += gridItem.height
            }
        }
        self.columns = columns
    }
    
    let spacing: CGFloat
    
    let horizontalPadding: CGFloat
    
    var body: some View {
        HStack(alignment: .top, spacing: spacing) {
            ForEach(columns) { column in
                LazyVStack(spacing: spacing) {
                    ForEach(column.gridItems) { gridItem in
                        URLImage(urlString: gridItem.imageURL)
                            .foregroundColor(.blue)
//                            .frame(height: gridItem.height)
                            .cornerRadius(10)
                    }
                }
            }
        }
        .padding(.horizontal, horizontalPadding)
    }
}

struct PinterestGridView_Previews: PreviewProvider {
    static var previews: some View {
        PinterestGridView(gridItems: [
            GridItem(height: 100, title: "1", imageURL: "https://s3.avatarapi.com/7b18eb6f263b1efb30f1dbb7f7c9a7accdebfbd710cc45d922d0c0dd48746876.gif"),
            GridItem(height: 300, title: "1", imageURL: "https://s3.avatarapi.com/7b18eb6f263b1efb30f1dbb7f7c9a7accdebfbd710cc45d922d0c0dd48746876.gif"),
            GridItem(height: 200, title: "1", imageURL: "https://s3.avatarapi.com/7b18eb6f263b1efb30f1dbb7f7c9a7accdebfbd710cc45d922d0c0dd48746876.gif"),
            GridItem(height: 50, title: "1", imageURL: "https://s3.avatarapi.com/7b18eb6f263b1efb30f1dbb7f7c9a7accdebfbd710cc45d922d0c0dd48746876.gif")],
                          numberOfColumns: 2)
    }
}
