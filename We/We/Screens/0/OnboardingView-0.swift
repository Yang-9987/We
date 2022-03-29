//
//  OnboardingView.swift
//  We
//
//  Created by Yang Jianqi on 2022/3/23.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var unLocked: Bool
    @State private var isAnimating: Bool = false
    @State private var SlideWidth: Double = UIScreen.main.bounds.width - 80
    @State private var OnboardingPic = mainPic
    @State private var picid:Int = 0
    @State private var SlideOffset: Double = 0
    
    var body: some View {
        
        VStack(spacing: 20) {
            //MARK: - Header
            Spacer()
            VStack(spacing: 5){
                Text("We")
                    .font(.system(size: 60))
                    .fontWeight(.heavy)
                
                Text("""
                        I Love U so much.
                        I Love U so much.
                        I Love U so much.
                        We're happy
                        """)
                    .font(.title3)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
            }
            .opacity(isAnimating ? 1 : 0)
            .offset(y:isAnimating ? -100 : -200)
            .animation(.easeOut(duration: 1), value: isAnimating)
            //MARK: - Center
            ZStack{
                ZStack{
                    HeartGroupView()
                        .offset(y:15)
                    
                    Image(OnboardingPic[picid])
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(width:150,height: 150)
                }
            }
            .opacity(isAnimating ? 1 : 0)
            .animation(.easeOut(duration: 1), value: isAnimating)
            Spacer()
            //
            Button(action: {
                if picid >= mainPic.count - 1 {
                    picid = 0
                } else {
                    picid = picid + 1
                }
            }) {
              HStack(spacing: 8) {
                Text("Change")
                      .foregroundColor(.gray)
                      .frame(alignment: .center)
                
                Image(systemName: "arrow.left.arrow.right.circle")
                      .foregroundColor(.gray)
                      .font(.system(size: 25))
              }
              .padding(.horizontal, 16)
              .padding(.vertical, 10)
              .background(
                .ultraThinMaterial
              )
              .cornerRadius(20)
              .offset(y:-25)
            }
            .opacity(isAnimating ? 1 : 0)
            .animation(.linear(duration: 1), value: isAnimating)
            //MARK: - Footer
            ZStack{
                //Part-1
                Capsule()
                    .fill(Color.red.opacity(0.2))
                Capsule()
                    .fill(Color.red.opacity(0.2))
                    .padding(12)
                
                //Part-2
                Text("Slide to Unlock")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .offset(x: 25)
                
                //Part-3
                HStack {
                    Capsule()
                        .fill(Color("OurBlue"))
                        .frame(width: SlideOffset + 80)
                        .opacity(0.8)
                    
                    Spacer()
                }
                
                //Part-4
                HStack {
                    ZStack {
                        Circle()
                            .fill(Color("OurBlue"))
                        Circle()
                            .fill(.black.opacity(0.2))
                            .padding(8)
                        Image(systemName: "chevron.right.2")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                    }
                    .foregroundColor(.white)
                    .frame(width: 80, height: 80 ,alignment: .center)
                    .offset(x: SlideOffset)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                withAnimation(Animation.linear){
                                    if gesture.translation.width > 0 && SlideOffset <= SlideWidth - 80 {
                                        SlideOffset = gesture.translation.width
                                    }
                                }
                            }
                            .onEnded { _ in
                                withAnimation(Animation.easeOut(duration: 0.4)){
                                    if SlideOffset > SlideWidth - 80 {
                                        playSound(sound: "success", type: "m4a")
                                        SlideOffset = SlideWidth - 80
                                        unLocked = true
                                    } else {
                                        SlideOffset = 0
                                    }
                                }
                            }
                    )
                    
                    Spacer()
                }
            }
            .opacity(isAnimating ? 1 : 0)
            .frame(width:SlideWidth, height: 80)
            .offset(y: isAnimating ? 0 : 110)
            .animation(.easeOut(duration: 1), value: isAnimating)
        }
        .onAppear {
            isAnimating = true
        }
    }
}
//MARK: - Preview
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(unLocked: .constant(true))
    }
}
