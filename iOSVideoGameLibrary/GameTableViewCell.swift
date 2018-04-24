//
//  GameTableViewCell.swift
//  iOSVideoGameLibrary
//
//  Created by Devan Allara on 4/20/18.
//  Copyright © 2018 Devan Allara. All rights reserved.
//

import UIKit

class GameTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var avaliableLabel: UILabel!
    
    func setUpCell(game: VideoGame) {
        nameLabel.text = game.title
        genreLabel.text = game.genre
        if game.availability {
            avaliableLabel.text = "Avaliable"
            avaliableLabel.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        } else {
            avaliableLabel.text = "Not Avaliable"
            avaliableLabel.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }
    }
}
