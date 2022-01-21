//
//  ViewController.swift
//  GuessTheNumberApp
//
//  Created by Ярослав Акулов on 21.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var gameNameLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        gameNameLabel.adjustsFontSizeToFitWidth = true
    }

    @IBAction func startNewGameButton() {
    }
    
    
}

