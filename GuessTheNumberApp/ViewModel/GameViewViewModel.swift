//
//  GameViewViewModelType.swift
//  GuessTheNumberApp
//
//  Created by Ярослав Акулов on 22.01.2022.
//

import Foundation

class GameViewViewModel: GameViewModelType {
    
    var guesser: Guesser
    
    var roundNumber: String
    
    var chosenNumber: String
    
    init(chosenNumber: String) {
        self.chosenNumber = chosenNumber
    }
    
    
    
}
