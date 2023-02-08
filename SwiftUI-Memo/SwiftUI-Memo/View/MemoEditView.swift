//
//  MemoEditView.swift
//  SwiftUI-Memo
//
//  Created by 김인환 on 2023/01/31.
//

import SwiftUI

struct MemoEditView: View {
    
    @State var memo: Memo
    @EnvironmentObject var memoGroup: MemoGroup
    
    var isNew: Bool = false
    @State private var isEditComplete = false
    
    var body: some View {
        TextEditor(text: $memo.content)
            .onDisappear(perform: {
                if !isEditComplete && isNew {
                    memoGroup.list.remove(at: 0)
                }
            })
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        memoGroup.list.first?.content = memo.content
                        isEditComplete = true
                    } label: {
                        Text("완료")
                    }
                    .opacity(isNew ? 1 : 0)
                }
            }
    }
}

struct MemoEditView_Previews: PreviewProvider {
    static var previews: some View {
        MemoEditView(memo: Memo(content: "hihi"))
            .environmentObject(MemoGroup())
    }
}
