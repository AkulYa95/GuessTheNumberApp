//
//  StartGameViewViewModelType.swift
//  GuessTheNumberApp
//
//  Created by Ярослав Акулов on 21.01.2022.
//

import Foundation

protocol StartGameViewModelType {
    var chosenNumber: Box<String?> {get}
    
    func viewModelForGame() -> GameViewModelType?
}


