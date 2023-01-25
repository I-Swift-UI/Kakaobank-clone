//
//  HomeGirdBoxView.swift
//  Kakaobank-clone-loinsir
//
//  Created by 김인환 on 2023/01/25.
//

import SwiftUI

struct HomeGridBoxView: View {
    
    var title: String
    var titleColor: Color = .black
    var subtitle: String
    var subtitleColor: Color = .gray
    var imageName: String
    var backgroundColor: Color
    var size: CGSize
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .foregroundColor(titleColor)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text(subtitle)
                    .foregroundColor(subtitleColor)
                    .fontWeight(.medium)
            }
            .position(x: geometry.size.width / 2.5,
                      y: geometry.size.height / 6)
            
            Image(systemName: imageName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(Color(white: 0, opacity: 0.2))
                .scaledToFit()
                .frame(width: 45, height: 45)
                .position(x: geometry.size.width / 1.2,
                          y: geometry.size.height / 1.15)
            
        }.frame(width: size.width,
                height: size.height)
         .background(backgroundColor)
         .cornerRadius(size.height / 20)
    }
}

struct HomeBoxGridView_Previews: PreviewProvider {
    static var previews: some View {
        HomeGridBoxView(title: "10,400원", subtitle: "카카오페이증권", imageName: "creditcard", backgroundColor: .yellow, size: .init(width: 215, height: 255))
    }
}
