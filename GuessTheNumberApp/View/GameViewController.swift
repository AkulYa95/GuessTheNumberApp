//
//  GameViewController.swift
//  GuessTheNumberApp
//
//  Created by Ярослав Акулов on 22.01.2022.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var roundLabel: UILabel!
    @IBOutlet var guesserLabel: UILabel!
    @IBOutlet var playerGuessTF: UITextField!
    @IBOutlet var playerHelpLabel: UILabel!
    @IBOutlet var computerGuessLabel: UILabel!
    
    var viewModel: GameViewModelType?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let viewModel = viewModel else {return}
        roundLabel.text = viewModel.chosenNumber


        // Do any additional setup after loading the view.
    }
    
    @IBAction func lessButtonPressed() {
    }
    
    @IBAction func equalButtonPressed() {
    }
    
    @IBAction func moreButtonPressed() {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
