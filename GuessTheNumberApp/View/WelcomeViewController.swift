//
//  ViewController.swift
//  GuessTheNumberApp
//
//  Created by Ярослав Акулов on 21.01.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var gameNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameNameLabel.adjustsFontSizeToFitWidth = true
    }
        
}

