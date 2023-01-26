//
//  HomeGirdBoxView.swift
//  Kakaobank-clone-loinsir
//
//  Created by 김인환 on 2023/01/25.
//

import SwiftUI

struct HomeGridBoxView: View {
    
    var title: String
    var titleFont = Font.system(size: 30, weight: .semibold)
    var titleColor: Color = .black
    var subtitle: String
    var subtitleColor: Color = .gray
    var imageName: String? = nil
    var backgroundColor: Color
    
    var bottomTitle: String? = nil
    var bottomDate: String? = nil
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .frame(width: .infinity)
                    .foregroundColor(titleColor)
                    .font(titleFont)
                    .minimumScaleFactor(1)
                    .offset(x: 10, y: 10)
                
                Text(subtitle)
                    .frame(width: .infinity)
                    .foregroundColor(subtitleColor)
                    .fontWeight(.medium)
                    .offset(x: 10, y: 10)
                
                Spacer()
                
                if let imageName = imageName {
                    Image(systemName: imageName ?? "")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFit()
                        .frame(width: 45, height:  45 / 257 * geometry.size.height, alignment: .trailing)
                        .alignmentGuide(.leading, computeValue: { d in
                            d[.leading] - geometry.size.width + 55
                        })
                        .foregroundColor(Color(white: 0.6, opacity: 1))
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                } else {
                    VStack(alignment: .trailing, spacing: 5) {
                        Text(bottomTitle ?? "")
                            .foregroundColor(Color(uiColor: .gray))
                        Text(bottomDate ?? "")
                            .fontWeight(.medium)
                            .foregroundColor(subtitleColor)
                    }
                    .alignmentGuide(.leading, computeValue: { d in
                        d[.leading] - geometry.size.width + 130
                    })
                    .offset(y: -5)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(backgroundColor)
        .cornerRadius(10)
    }
}

struct HomeBoxGridView_Previews: PreviewProvider {
    static var previews: some View {
        HomeGridBoxView(title: "10,400원", subtitle: "송금", imageName: "creditcard", backgroundColor: .yellow)
            .frame(width: 214, height: 257)
    }
}
