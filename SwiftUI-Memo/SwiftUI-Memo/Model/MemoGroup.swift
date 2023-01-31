//
//  MemoGroup.swift
//  SwiftUI-Memo
//
//  Created by 김인환 on 2023/01/31.
//

import Foundation

class MemoGroup: ObservableObject, Identifiable {
    
    let id: UUID
    @Published var list: [Memo]
    
    init() {
        id = UUID()
        list = [
            Memo(content: "새로운 메모입니다. 더미데이트를 쌓아봅시다", date: Date.now),
            Memo(content: "새로운 메모2", date: Date.now.addingTimeInterval(3600 * -24)),
            Memo(content: "새로운 메모2", date: Date.now.addingTimeInterval(3600 * -48))
        ]
    }
    
    func insert(memo: String) {
        list.insert(Memo(content: memo), at: 0)
    }
    
    func update(memo: Memo?, content: String) {
        guard let memo = memo else {
            return
        }
        memo.content = content
    }
    
    func delete(memo: Memo) {
        list.removeAll { $0.id == memo.id }
    }
}
