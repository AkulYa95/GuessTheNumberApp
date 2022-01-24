//
//  StartGameViewController.swift
//  GuessTheNumberApp
//
//  Created by Ярослав Акулов on 21.01.2022.
//

import UIKit

class StartGameViewController: UIViewController {
    
    @IBOutlet var boundsLabel: UILabel!
    @IBOutlet var selectedNumberTF: UITextField!
    
    var viewModel: StartGameViewModelType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    @IBAction func selectedNumberButtonPressed() {
        guard let viewModel = viewModel else {return}
        
        if viewModel.checkString(onInt: selectedNumberTF.text) {
            
            viewModel.chosenNumber.value = selectedNumberTF.text
            
            performSegue(withIdentifier: SegueIdentifier.gameSegue.rawValue, sender: nil)
        } else {
            createAlertController(
                with: "Invalid data",
                message: "Please insert Integer from \(viewModel.minBound) to \(viewModel.maxBound)")
        }
    }
    
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewModel = viewModel else {return}
        if let gameVC = segue.destination as? GameViewController{
            gameVC.viewModel = viewModel.viewModelForGame()
        }
    }
}
// MARK: - Keyboard Settings
extension StartGameViewController {
    
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
    }
}

extension StartGameViewController {
    
    func createAlertController(with title:String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.selectedNumberTF.text = nil
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func updateUI() {
        boundsLabel.adjustsFontSizeToFitWidth = true
        viewModel = StartGameViewViewModel()
        addBarButtonTo(selectedNumberTF)
        guard let viewModel = viewModel else {return}
        boundsLabel.text = "Please guess number from \(viewModel.minBound) to \(viewModel.maxBound)"
    }
}
