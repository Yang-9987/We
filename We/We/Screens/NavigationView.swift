//
//  NavigationView.swift
//  We
//
//  Created by Yang Jianqi on 2022/3/25.
//

import SwiftUI

struct navigationView: View {
    @State var unLocked: Bool = false
    
    var body: some View {
        ZStack{
            if unLocked {
                MainView()
            } else {
                OnboardingView(unLocked: $unLocked)
            }
        }
    }
}

struct navigationView_Previews: PreviewProvider {
    static var previews: some View {
        navigationView()
    }
}
