//
//  StartGameViewViewModel.swift
//  GuessTheNumberApp
//
//  Created by Ярослав Акулов on 21.01.2022.
//

import Foundation

class StartGameViewViewModel: StartGameViewModelType {
  
    var chosenNumber: Box<String?> = Box(nil)
    
    var selectedNumber: String {
        return chosenNumber.value ?? "Not Found"
    }
    
    func viewModelForGame() -> GameViewModelType? {
        return GameViewViewModel(chosenNumber: selectedNumber)
    }
}
