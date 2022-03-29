//
//  MainView.swift
//  We
//
//  Created by Yang Jianqi on 2022/3/25.
//

import SwiftUI
import Foundation

//MARK: - Extensions
//extension Text {
//    func SamllText() -> some View {
//        self
//            .font(.system(size: 10))
//    }
//}

struct MainView: View {
    //MARK: - Properties
    @State private var storys = Story.sampleData
    
    //MARK: - Body
    var body: some View {
        TabView {
            ContentView(storys: $storys)
                .tabItem {
                    Image(systemName: "heart.circle")
                    Text("Moments")
                }
            
            SpecialDaysView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("SpecialDays")
                }
            
            SocialNetwork()
                .tabItem {
                    Image(systemName: "person.3")
                    Text("SocialNetwork")
                }
            
            SettingViews()
                .tabItem {
                    Image(systemName: "gearshape")
                        .font(.system(size: 20, weight: .ultraLight, design: .monospaced))
                    Text("Settings")
                }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
