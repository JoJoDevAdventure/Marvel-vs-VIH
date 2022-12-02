//
//  Data.swift
//  Find me
//
//  Created by Youssef Bhl on 28/11/2022.
//

import Foundation

class Data {
    
    static let shard = Data()
    
    let Levels: [Level] = [
        Level(number: 1,
              finished: true,
              imagePath: "lvl1.background",
              hiddenHero: "lvl1.hero",
              time: 0, errors: 0,
              heroLocations: [
                CGPoint(x: 236, y: 155),
                CGPoint(x: 75, y: 400),
                CGPoint(x: 200, y: 350)],
              hints: [[
                    "",
                    "C'est encadré",
                    "À l'étage"],
                    ["C'est l'affichage",
                    "Un écran à été oublie allumé ?",
                    "C'est surement claire comme un écran"],
                    ["C'est la jungle ou quoi ?",
                    "Appel moi mowgli",
                     "Suis-je un héro ou bien un oiseaux ?"]
                ]
             ),

        Level(number: 2,
              finished: true,
              imagePath: "lvl2.background",
              hiddenHero: "lvl2.hero",
              time: 0, errors: 0,
              heroLocations: [
                CGPoint(x: 90, y: 70),
                CGPoint(x: 95, y: 400),
                CGPoint(x: 230, y: 400)],
              hints: [[
                    "",
                    "De là ou vien la foudre",
                    "Une vue incroyable"],
                    ["Couvre-chef",
                    "Un Chapteamerica",
                    "Chapostique"],
                    ["Plus efficace qu'un bouclier",
                    "Epaulirex",
                     "Entre de bonnes main, ou épaules"]
                ]
             ),

        Level(number: 3,
              finished: true,
              imagePath: "lvl3.background",
              hiddenHero: "lvl3.hero",
              time: 0, errors: 0,
              heroLocations: [
                CGPoint(x: 410, y: 120),
                CGPoint(x: 75, y: 430),
                CGPoint(x: 10, y: 390)],
              hints: [[
                    "",
                    "Bien fondu avec le décor",
                    "Ses yeux brilles"],
                    ["À ne pas confondre avec un boutton",
                    "Quel Iron-li (ironnie)",
                    "Third hint"],
                    ["Sous",
                    "Le",
                     "Lis"]
                ]
             ),
        
        Level(number: 4,
              finished: true,
              imagePath: "lvl4.background",
              hiddenHero: "lvl4.hero",
              time: 0, errors: 0,
              heroLocations: [
                CGPoint(x: 30, y: 350),
                CGPoint(x: 295, y: 245),
                CGPoint(x: 40, y: 200)],
              hints: [[
                    "",
                    "Sacré poignée",
                    "Un coup en fer"],
                    ["Coup de hanche",
                    "Fais office de ceinture",
                    "Third hint"],
                    ["First hint",
                    "Second hint",
                     "Third hint"]
                ]
             ),
        
        
    ]
    
    let ranks: [Score] = [
        Score(name: "Youssef", errors: 4, time: 1, score: 999.99),
        Score(name: "Kamel", errors: 3, time: 1000, score: 45.42),
        Score(name: "Farah", errors: 6, time: 1, score: 103.44),
        Score(name: "Chaima", errors: 10, time: 1, score: 123.44),
    ]
    
    
    
}

