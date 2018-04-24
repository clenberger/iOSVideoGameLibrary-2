//
//  GameManager.swift
//  iOSVideoGameLibrary
//
//  Created by Devan Allara on 4/19/18.
//  Copyright © 2018 Devan Allara. All rights reserved.
//

import Foundation
import RealmSwift

final class GameManager {
    
    static let sharedInstance = GameManager()
    
    private init() {
        games = realm.objects(VideoGame.self)
    }
    
    let realm = try! Realm()
    
    let calendar = Calendar.current
    
    var games: Results<VideoGame>!
    
    func addGame(_ game: VideoGame) {
        try! realm.write {
            realm.add(game)
        }
    }
    
    func removeGame(_ game: VideoGame) {
        try! realm.write {
            realm.delete(game)
        }
    }
    
    func getGame(index: Int) -> VideoGame {
        return games[index]
    }
    
    func getGameCount() -> Int {
        return games.count
    }
    
    
    func checkInOrOut(game: VideoGame) {
        try! realm.write {
            if game.availability {
                game.availability = false
                game.dueDate = calendar.date(byAdding: .day, value: 3, to: Date())!
            } else {
                game.availability = true
                game.dueDate = Date()
            }
        }
    }
}
