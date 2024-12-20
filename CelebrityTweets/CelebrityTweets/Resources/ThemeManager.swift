//
//  ThemeManager.swift
//  CelebrityTweets
//
//  Created by Hichem on 2024-11-01.
//

import SwiftUI

struct ThemeManager {
    struct Colors {
        static let blue1 = Color(red: 55 / 255, green: 175 / 255, blue: 225 / 255)
        static let blue2 = Color(red: 76 / 255, green: 201 / 255, blue: 254 / 255)
        static let yellow1 = Color(red: 245 / 255, green: 244 / 255, blue: 179 / 255)
        static let yellow2 = Color(red: 255 / 255, green: 254 / 255, blue: 203 / 255)
    }
    
    struct Fonts {
//        static let headline = Font.system(size: 18, weight: .bold, design: .default)
//        static let body = Font.system(size: 16, weight: .regular, design: .default)
        // Custom font using the "Anton" font
        static let headline = Font.custom("IBMPlexMono-Bold", size: 27)
        // Custom font using the "IBM Plex Mono" font
        static let body = Font.custom("IBMPlexMono-Regular", size: 16)
    }
}
