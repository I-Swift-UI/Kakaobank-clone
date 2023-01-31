//
//  Memo.swift
//  SwiftUI-Memo
//
//  Created by 김인환 on 2023/01/31.
//

import SwiftUI

class Memo: Identifiable, ObservableObject {
    let id: UUID
    @Published var content: String
    let date: Date
    
    init(content: String, date: Date = Date.now) {
        id = UUID()
        self.content = content
        self.date = date
    }
}
