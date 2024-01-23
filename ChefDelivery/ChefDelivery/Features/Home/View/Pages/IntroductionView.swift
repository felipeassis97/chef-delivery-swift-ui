//
//  HomeView.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 07/01/24.
//

import SwiftUI

struct IntroductionView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @State private var isAnimated = false
    @State private var imageOffSet: CGSize = .zero
    @State private var buttonOffSet: CGFloat = .zero
    
    let buttonHeight: CGFloat = 80
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .foregroundStyle(.colorRed)
                    .frame(width: 200)
                    .position(x: 50, y: 100)
                    .blur(radius: 60)
                    .opacity(0.5)
                
                Circle()
                    .foregroundStyle(.colorRedVariant)
                    .frame(width: 200)
                    .position(x: geometry.size.width - 50, y: geometry.size.height)
                    .blur(radius: 60)
                    .opacity(0.5)
                
                VStack {
                    Text("Chef Delivery")
                        .font(.customStyle(type: .nunito, style: .bold, size: 40))
                        .foregroundStyle(.colorRed)
                        .opacity(isAnimated ? 1 : 0)
                        .offset(y: isAnimated ? 0 : -40)
                    
                    Text("Peça as suas comidas no conforto da sua casa")
                        .font(.customStyle(type: .nunito, style: .medium, size: 20))
                        .padding()
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.black.opacity(0.7))
                        .opacity(isAnimated ? 1 : 0)
                        .offset(y: isAnimated ? 0 : -40)
                    
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 60)
                        .padding(isAnimated ? 32 : 92)
                        .opacity(isAnimated ? 1 : 0)
                        .offset(x: imageOffSet.width, y: imageOffSet.height)
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        imageOffSet = gesture.translation
                                    }
                                })
                                .onEnded({ _ in
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        imageOffSet = .zero
                                    }
                                })
                        )
                    
                    ZStack {
                        Capsule()
                            .fill(.colorRed)
                            .opacity(0.2)
                        
                        Capsule()
                            .fill(.colorRed)
                            .opacity(0.2)
                            .padding(8)
                        
                        Text("Descubra mais")
                            .font(.customStyle(type: .nunito, style: .bold, size: 24))

                            .bold()
                            .foregroundStyle(.colorRed)
                            .offset(x: 20)
                        
                        HStack {
                            Capsule()
                                .fill(.colorRed)
                                .frame(width: buttonOffSet + buttonHeight)
                            Spacer()
                        }
                        
                        HStack {
                            ZStack {
                                Circle()
                                    .fill(.colorRed)
                                
                                Circle()
                                    .fill(.colorRedVariant)
                                    .padding(8)
                                
                                Image(systemName: "chevron.right.2")
                                    .font(.system(size: 24))
                                    .bold()
                                    .foregroundStyle(.white)
                            }
                            Spacer()
                        }
                        .offset(x: buttonOffSet)
                        .gesture(DragGesture()
                            .onChanged({ gesture in
                                if gesture.translation.width >= 0 &&
                                    buttonOffSet <= (geometry.size.width - 60) - buttonHeight {
                                    withAnimation(.easeInOut(duration: 0.25)) {
                                        buttonOffSet = gesture.translation.width
                                    }
                                }
                            })
                                .onEnded({ _ in
                                    if buttonOffSet > (geometry.size.width - 60) / 2 {
                                        coordinator.push(.home)
                                    } else {
                                        withAnimation(.easeInOut(duration: 0.25)) {
                                            buttonOffSet = .zero
                                        }
                                    }
                                
                            })
                        )
                        
                    }
                    .frame(width: geometry.size.width - 60, height: buttonHeight)
                    .opacity(isAnimated ? 1 : 0)
                    .offset(y: isAnimated ? 0 : 100)
                }
                .onAppear {
                    withAnimation(.easeInOut(duration: 1.5)) {
                        isAnimated = true
                    }
                }
            }
        }
    }
}

#Preview {
    IntroductionView()
}
