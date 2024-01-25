//
//  PromotionalBannerItemView.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 05/01/24.
//

import SwiftUI
import Kingfisher

struct PromotionalBannerItemView: View {
    //MARK: Atributes
    let banner: Banner

    var body: some View {
        ZStack {
            KFImage(URL(string: banner.image))
                .placeholder({ _ in
                    Rectangle()
                        .scaledToFill()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .foregroundStyle(.gray.opacity(0.1))
                        .padding(.horizontal, 24)
                })
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }

    }
}

#Preview {
    PromotionalBannerItemView(banner:  Banner(id: 1, image: "barbecue-banner"))
}
