//
//  CreditsView.swift
//  We
//
//  Created by Yang Jianqi on 2022/3/23.
//

import SwiftUI

struct CreditsView: View {
  var body: some View {
    VStack {
      Image("LaunchImage")
        .resizable()
        .scaledToFit()
        .frame(width: 128, height: 128)
      
      Text("""
  Copyright © Walter Yang
  All right reserved
  Better Apps ♡ Less Code
  """)
        .font(.footnote)
        .multilineTextAlignment(.center)
    } //: VSTACK
    .padding()
    .opacity(0.3)
  }
}

struct CreditsView_Previews: PreviewProvider {
  static var previews: some View {
    CreditsView()
  }
}
