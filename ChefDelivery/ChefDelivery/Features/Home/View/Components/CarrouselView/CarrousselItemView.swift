//
//  CarrousselItemView.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 05/01/24.
//

import SwiftUI

struct CarrousselItemView: View {
    //MARK: Atributes
    let banner: Banner
    let downloadImage = DownloadImageService()
    
    //MARK: States
    @State private var image: UIImage?

    var body: some View {
        ZStack {
            if image != nil {
                Image(uiImage: image!)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            } else {
                Rectangle()
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .foregroundStyle(.gray.opacity(0.1))
                    .padding(.horizontal, 24)
            }
        }
        .onAppear {
            Task {
                image = try? await downloadImage.dowloadImage(from: banner.image)
            }
        }
    }
}

#Preview {
    CarrousselItemView(banner:  Banner(id: 1, image: "barbecue-banner"))
}
