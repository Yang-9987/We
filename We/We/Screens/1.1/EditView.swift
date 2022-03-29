//
//  EditView.swift
//  We
//
//  Created by Yang Jianqi on 2022/3/28.
//

import SwiftUI

struct StoryEditView: View {
    @Binding var data: Story.Data
    
    var body: some View {
        Form{
            Section(header: Text("Moments Info")) {
                TextField("Title", text: $data.title)
                HStack {
                    DatePicker("日期", selection: $data.dd)
                }

                MoodPicker(selection: $data.mood)
                TextField("Place", text: $data.place)
                TextField("City", text: $data.city)
                Toggle(isOn: $data.isFavorite){
                    Text("Favorites")
                }
                ZStack(alignment: .topLeading) {
                    TextEditor(text: $data.description)
                        .frame(height: 150)
                        .border(Color.blue)

                        if data.description.isEmpty {
                            Text("Type something")
                                .foregroundColor(Color(UIColor.placeholderText))
                                .padding(8)
                  }
                }
            }
        }
    }
}

struct StoryEditView_Previews: PreviewProvider {
    static var previews: some View {
        StoryEditView(data: .constant(Story.sampleData[0].data))
    }
}
