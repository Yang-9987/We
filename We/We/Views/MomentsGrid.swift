//
//  MomentsGrid.swift
//  We
//
//  Created by Yang Jianqi on 2022/3/28.
//

import SwiftUI

struct MomentsGrid: View {
    var story: Story
    @State private var SlideWidth: Double = UIScreen.main.bounds.width
    @State private var fontsize: CGFloat = 15
    
    var body: some View {
        ZStack(alignment: .bottom) {
            story.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .cornerRadius(15)
                .padding(4)
            HStack {
                Text(story.mood.moodImg)
                    .padding(10)
                    
                Spacer()
                Text(date2string(Datestr: story.dd))
                    .padding(10)
                    
            }
            .frame(height:30)
            .foregroundColor(.white)
            .background(.ultraThinMaterial)
        }
        .background(.ultraThinMaterial)
        .cornerRadius(15)
    }
}

struct MomentsGrid_Previews: PreviewProvider {
    static var previews: some View {
        MomentsGrid(story: Story.sampleData[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
