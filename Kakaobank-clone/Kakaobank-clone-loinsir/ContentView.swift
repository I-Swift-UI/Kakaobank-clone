//
//  ContentView.swift
//  Kakaobank-clone-loinsir
//
//  Created by 김인환 on 2023/01/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 7) {
            HStack(spacing: 7) {
                HomeGridBoxView(title: "15,400원", subtitle: "카카오페이증권", imageName: "creditcard", backgroundColor: .yellow).frame(width:214, height: 257)
                VStack(spacing: 7) {
                    HomeGridBoxView(title: "선택하기", titleFont: Font.system(size: 18, weight: .semibold),
                                        titleColor: .white, subtitle: "송금", imageName: "creditcard", backgroundColor: .black).frame(width:105, height: 125)
                    HomeGridBoxView(title: "선택하기", titleFont: Font.system(size: 18, weight: .semibold), titleColor: .white, subtitle: "결제", imageName: "creditcard", backgroundColor: .black).frame(width:105, height: 125)
                }
            }
            HomeGridBoxView(title: "카카오모빌리티", titleColor: .white, subtitle: "4,000원", backgroundColor: Color(uiColor: UIColor.darkGray), bottomTitle: "결제", bottomDate: "01.24(화) 09:58").frame(width:326, height: 124)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
