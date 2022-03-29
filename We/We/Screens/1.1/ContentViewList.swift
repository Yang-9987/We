//
//  ContentView.swift
//  We
//
//  Created by Yang Jianqi on 2022/3/23.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    
    @State private var isPresentingNewStoryView: Bool = false
    @State private var isGridViewActive: Bool = false
    @State private var smallFont: Bool = false
    
    @State private var gridLayout: [GridItem] = [ GridItem(.flexible()) ]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    @Binding var storys: [Story]
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    //MARK: - Functions
    
    func gridSwitch() {
      gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
      gridColumn = gridLayout.count
      print("Grid Number: \(gridColumn)")
      print(smallFont)
      
      // TOOLBAR IMAGE
      switch gridColumn {
      case 1:
        toolbarIcon = "square.grid.2x2"
        smallFont = false
      case 2:
        toolbarIcon = "square.grid.3x2"
        smallFont = false
      case 3:
        toolbarIcon = "rectangle.grid.1x2"
        smallFont = true
      default:
        toolbarIcon = "square.grid.2x2"
        smallFont = false
      }
    }
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        ForEach($storys) { $story in
                            NavigationLink(destination: DetailView(story: $story)) {
                                MomentsRow(story: story)
                            }//Link
                        }//ForEach
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach($storys) { $story in
                                NavigationLink(destination: DetailView(story: $story)) {
                                    MomentsGrid(story: story)
                                        .font(.system(size: smallFont ? 10 : 15))
                                }//Link
                            }
                        }
                        .padding(10)
                        .animation(.easeIn, value: gridColumn)
                    }//Scroll
                }
            }//Group
            .navigationBarTitle("Moments")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        Button(action: {
                            isPresentingNewStoryView = true
                        }) {
                            Image(systemName: "plus")
                                .font(.title2)
                        }//Button-1
                        .frame(width: 50)
                        
                        Button(action: {
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }) {
                            Image(systemName: "square.fill.text.grid.1x2")
                              .font(.title2)
                              .opacity(isGridViewActive ? 1 : 0.2)
                        }//Button-2
                        .frame(width: 50)
                        
                        Button(action: {
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        }) {
                            Image(systemName: toolbarIcon)
                              .font(.title2)
                              .opacity(isGridViewActive ? 0.2 : 1)
                        }//Button-3
                        .frame(width: 50)
                    }
                }
            }
        }//NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(storys: .constant(Story.sampleData))
    }
}
