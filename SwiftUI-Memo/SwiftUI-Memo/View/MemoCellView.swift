//
//  MemoCellView.swift
//  SwiftUI-Memo
//
//  Created by 김인환 on 2023/01/31.
//

import SwiftUI

struct MemoCellView: View {
    
    @ObservedObject var memo: Memo
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(memo.content)
                .lineLimit(1)
                .bold()
            Text(memo.date.formatted(date: .abbreviated, time: .omitted))
                .lineLimit(1)
                .foregroundColor(.secondary)
        }
    }
}


struct MemoCellView_Previews: PreviewProvider {
    static var previews: some View {
        MemoCellView(memo: Memo(content: "Memo Title"))
    }
}
