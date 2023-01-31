//
//  SwiftUI_MemoApp.swift
//  SwiftUI-Memo
//
//  Created by 김인환 on 2023/01/31.
//

import SwiftUI

@main
struct SwiftUI_MemoApp: App {
    
    @StateObject var memoGroup = MemoGroup()
    
    var body: some Scene {
        WindowGroup {
            MainListView()
                .environmentObject(memoGroup)
        }
    }
}
