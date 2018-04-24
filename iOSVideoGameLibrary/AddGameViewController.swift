//
//  AddGameViewController.swift
//  iOSVideoGameLibrary
//
//  Created by Devan Allara on 4/18/18.
//  Copyright © 2018 Devan Allara. All rights reserved.
//

import UIKit

class AddGameViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var gameTitleTextfield: UITextField!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    let genres = ["RPG", "Shooter", "Platformer", "Battle Royale", "MMORPG", "Sandbox", "Fighting Game", "Survival"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genres.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genres[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
 
    

    
  
    @IBAction func saveButtonTapped(_ sender: Any) {
        if (gameTitleTextfield.text?.isEmpty)! {
            let alert = UIAlertController(title: "Error", message: "Please fill in a game title", preferredStyle: .alert)
            self.present(alert, animated: true)
        } else{
            let newGame = VideoGame()
            newGame.title = gameTitleTextfield.text!
            newGame.genre = genres[pickerView.selectedRow(inComponent:0)]
            GameManager.sharedInstance.addGame(newGame)
            self.performSegue(withIdentifier: "unwindToLibrary", sender: self)
        }
        
    }
    
}














