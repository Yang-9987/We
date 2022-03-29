//
//  Moments.swift
//  We
//
//  Created by Yang Jianqi on 2022/3/24.
//

import Foundation
import SwiftUI

struct Story: Codable, Identifiable {
    var id: UUID
    var dd: Date
    var title: String
    var mood: Mood
    var place: String
    var city: String
    var isFavorite: Bool
    var description: String
    //var location
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    init(id: UUID = UUID(), dd: Date, title: String, mood: Mood, place: String, city: String, isFavorite: Bool, description: String, imageName: String) {
        self.id = id
        self.dd = dd
        self.title = title
        self.mood = mood
        self.place = place
        self.city = city
        self.isFavorite = isFavorite
        self.description = description
        self.imageName = imageName
    }
}

extension Story {
    struct Data {
        var dd: Date = Date()
        var title: String = "title"
        var mood: Mood = .Confused
        var place: String = "Beijing"
        var city: String = ""
        var isFavorite: Bool = false
        var description: String = ""
        var imageName: String = ""
    }

    var data: Data {
        Data(dd:dd, title: title, mood: mood, place: place, city: city, isFavorite: isFavorite, description: description, imageName: imageName)
    }
    
    mutating func update(from data: Data) {
        dd = data.dd
        title = data.title
        mood = data.mood
        place = data.place
        city = data.city
        isFavorite = data.isFavorite
        description = data.description
        imageName = data.imageName
    }

    init(data: Data) {
        id = UUID()
        dd = data.dd
        title = data.title
        mood = data.mood
        place = data.place
        city = data.city
        isFavorite = data.isFavorite
        description = data.description
        imageName = data.imageName
    }
}

extension Story {
    static let sampleData:[Story] =
    [
        Story(dd: string2data(strDate: "2022-01-04"), title: "First Skiing", mood: .Happy, place: "Nanshan", city: "Beijing", isFavorite: true, description: "非常开心", imageName: "Snow_1"),
        Story(dd: string2data(strDate: "2021-12-31"), title: "New Year", mood: .Confused, place: "Sanlitun", city: "Beijing", isFavorite: false, description: "惊喜且意外", imageName: "NewYear_1"),
        Story(dd: string2data(strDate: "2022-02-14"), title: "2022情人节", mood: .Happy, place: "黔灵山", city: "GuiYang", isFavorite: true, description: "爬山开心嘿嘿嘿", imageName: "Val_mountain"),
        Story(dd: string2data(strDate: "2021-09-07"), title: "Universal Studio", mood: .Surprised, place: "环球影城", city: "Beijing", isFavorite: true, description: "耶耶耶耶耶耶耶耶耶", imageName: "Universal_1"),
        Story(dd: string2data(strDate: "2022-02-13"), title: "去见我的宝贝啦", mood: .Happy, place: "Wanda", city: "GuiYang", isFavorite: false, description: "时隔30天终于见面啦", imageName: "Val_1"),
        Story(dd: string2data(strDate: "2021-12-25"), title: "考研加油", mood: .Nervous, place: "民大", city: "Beijing", isFavorite: false, description: "紧张虽迟但到", imageName: "Kaoyan_1"),
        
    ]
}
