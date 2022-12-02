//
//  Level.swift
//  Find me
//
//  Created by Youssef Bhl on 28/11/2022.
//

import Foundation

struct Level {
    var number: Int
    var finished: Bool
    var imagePath: String
    var hiddenHero: String
    var time: Int
    var errors: Int
    var heroLocations: [CGPoint]
    var hints: [[String]]
}
