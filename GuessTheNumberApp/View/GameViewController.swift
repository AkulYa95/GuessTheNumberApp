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
    
    @IBOutlet var answerButtons: [UIButton]!
    
    var viewModel: GameViewModelType?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        addBarButtonTo(playerGuessTF)
        updateUI()
    }
    
    func updateUI() {
        guard let viewModel = viewModel else {return}
        guesserLabel.text = "\(viewModel.guesser.rawValue) guesses"
        switch viewModel.guesser {
        case .computer:
            computerGuessLabel.isHidden = false
            answerButtons.forEach { button in
                button.isHidden = false
            }
            playerHelpLabel.isHidden = true
            playerGuessTF.isHidden = true
            roundLabel.text = "Round №\(viewModel.roundNumber)"
            computerGuessLabel.text = "number is - \(viewModel.computerAnswer)"

        case .player:
            playerGuessTF.isHidden = false
            answerButtons.forEach { button in
                button.isHidden = true
            }
            computerGuessLabel.isHidden = true
            playerGuessTF.text = nil
        }
    }
    
    @IBAction func moreButtonPressed() {
        guard  let viewModel = viewModel else {return}
        guard viewModel.validateAnswer(parameter: .more) else {
            lieAlert()
            return
        }
        viewModel.moreAnswer()
        updateUI()
    }
    
    @IBAction func equalButtonPressed() {
        guard  let viewModel = viewModel else {return}
        guard viewModel.validateAnswer(parameter: .equal) else {
            lieAlert()
            return
        }
        performSegue(withIdentifier: SegueIdentifier.loseSegue.rawValue, sender: nil)
    }
    
    @IBAction func lessButtonPressed() {
        guard  let viewModel = viewModel else {return}
        guard viewModel.validateAnswer(parameter: .less) else {
            lieAlert()
            return
        }
        viewModel.lessAnswer()
        updateUI()
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewModel = viewModel else {return}
        
        guard let finishVC = segue.destination as? FinishViewController else {return}
        if segue.identifier == SegueIdentifier.winSegue.rawValue {
            finishVC.viewModel = viewModel.viewModelForFinish(with: "You win!")
        } else if segue.identifier == SegueIdentifier.loseSegue.rawValue {
            finishVC.viewModel = viewModel.viewModelForFinish(with: "You lose!")
    }
    }


}

extension GameViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
    }
    
    private func addBarButtonTo(_ textfield: UITextField){
            let keyboardToolBar = UIToolbar()
            textfield.inputAccessoryView = keyboardToolBar
            keyboardToolBar.sizeToFit()
            
            let doneButton = UIBarButtonItem(title: "Done",
                                             style: .done,
                                             target: self,
                                             action: #selector(didTapDone))
            
            let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                                target: nil,
                                                action: nil)
            
            keyboardToolBar.items = [flexBarButton, doneButton]
        }
    
        @objc func didTapDone() {
            view.endEditing(true)
            guard let viewModel = viewModel else {return}
            if viewModel.checkString(onInt: playerGuessTF.text) {
                viewModel.playerAnswer.value = playerGuessTF.text
                guard let result = viewModel.returnResult() else {return}
                playerHelpLabel.text = "your number is \(result.rawValue)"
                playerHelpLabel.isHidden = false
                waitingForCheckResults()
                if result == Valid.equal {
                    performSegue(withIdentifier: SegueIdentifier.winSegue.rawValue, sender: nil)
                }
            } else {
                wrongFormatAlert()
            }
            
        }
}


extension GameViewController {
    
    func lieAlert() {
        let alert = UIAlertController(title: "Don't lie", message: "Be honest", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    func wrongFormatAlert() {
        let alert = UIAlertController(title: "Wrong format", message: "Please insert Integer", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.playerGuessTF.text = nil
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
extension GameViewController {
    
    func waitingForCheckResults() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            self.updateUI()
        }
    }
}
