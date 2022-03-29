//
//  DetailView.swift
//  We
//
//  Created by Yang Jianqi on 2022/3/25.
//

import SwiftUI

struct DetailView: View {
    @Binding var story: Story
    
    @State private var isPresentingEditView = false
    @State private var data = Story.Data()
    
    var body: some View {
        VStack {
            BlurImage(image: story.image)
                .ignoresSafeArea()
            
            CircleImage(image: story.image)
                .offset(y: -280)
                .padding(.bottom,-800)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(story.title)
                        .font(.title)
                }
                
                HStack {
                    Text(story.place)
                    Spacer()
                    Text(story.city)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("What To Say")
                    .font(.title2)
                Text(story.description)
                
            }
            .offset(y: 40)
            .padding(10)
            
            Spacer()
        }
        .navigationTitle(story.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                data = story.data
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView{
                StoryEditView(data: $data)
                    .navigationTitle(story.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                story.update(from: data)
                            }
                        }
                    }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group{
            DetailView(story: .constant(Story.sampleData[2]))
        }
    }
}

