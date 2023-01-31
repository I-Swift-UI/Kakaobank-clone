//
//  MemoEditView.swift
//  SwiftUI-Memo
//
//  Created by 김인환 on 2023/01/31.
//

import SwiftUI

struct MemoEditView: View {
    
    @State var memo: Memo
    
    var body: some View {
        VStack {
            TextEditor(text: $memo.content)
                .padding()
        }
    }
}

struct MemoEditView_Previews: PreviewProvider {
    static var previews: some View {
        MemoEditView(memo: Memo(content: "hihi"))
    }
}
