//
//  StartGameViewViewModel.swift
//  GuessTheNumberApp
//
//  Created by Ярослав Акулов on 21.01.2022.
//

import Foundation

class StartGameViewViewModel: StartGameViewModelType {
    
    var minBound: Int {
        return 1
    }
    
    var maxBound: Int {
        return 10
    }
    
  
    var chosenNumber: Box<String?> = Box(nil)
    
    var selectedNumber: String {
        return chosenNumber.value ?? "Not Found"
    }
    
    func viewModelForGame() -> GameViewModelType? {
        return GameViewViewModel(chosenNumber: selectedNumber, minBound: minBound, maxBound: maxBound)
    }
    
    func checkString(onInt text: String?) -> Bool {
        guard let text = text, let numeric = Int(text) else {return false}
        guard numeric >= minBound && numeric <= maxBound else {return false}
        return true
    }
}
