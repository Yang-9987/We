//
//  SwiftUIView.swift
//  We
//
//  Created by Yang Jianqi on 2022/3/24.
//

import SwiftUI

struct MomentsRow: View {
    var story: Story
    
    var body: some View {
        HStack {
            //MARK: - Left
            story.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 60, alignment: .center)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 2)
                }
                .shadow(radius: 7)
            VStack(alignment: .leading, spacing: 8){
                Text(story.title)
                    .bold()
                    .font(.system(size: 17))
                HStack {
                    Text(story.mood.moodImg)
                        .font(.system(size: 12))
                    Text(date2string(Datestr: story.dd))
                        .font(.system(size: 12, weight: .ultraLight))
                    
                }
            }
            
            Spacer()
            
            //MARK: - Right
            if story.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(Color("OurPink"))
                    .padding(20)
            }
        }
    }
}

struct MomentsRowView_Previews: PreviewProvider {
    static var storys = Story.sampleData
    
    static var previews: some View {
        Group {
            MomentsRow(story: storys[2])
        }
    }
}
