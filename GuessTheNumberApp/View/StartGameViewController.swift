//
//  StartGameViewController.swift
//  GuessTheNumberApp
//
//  Created by Ярослав Акулов on 21.01.2022.
//

import UIKit

class StartGameViewController: UIViewController {

    @IBOutlet var roundLabel: UILabel!
    @IBOutlet var selectedNumberTF: UITextField!
    
    var viewModel: StartGameViewModelType? {
        didSet {
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = StartGameViewViewModel()
        addBarButtonTo(selectedNumberTF)
        
    }
    
    @IBAction func selectedNumberButtonPressed() {
        viewModel?.chosenNumber.bind { [unowned self] in
            guard let number = $0 else {return}
            self.roundLabel.text = number
        }
        self.viewModel?.chosenNumber.value = selectedNumberTF.text
        
        performSegue(withIdentifier: "gameSegue", sender: nil)

    }
    
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewModel = viewModel else {return}
            if let dVC = segue.destination as? GameViewController{
                dVC.viewModel = viewModel.viewModelForGame()
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
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
    }
    
    func checkText(_ text: String) {
        
    }
}
