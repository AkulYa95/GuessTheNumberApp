//
//  StartGameViewViewModelType.swift
//  GuessTheNumberApp
//
//  Created by Ярослав Акулов on 21.01.2022.
//

import Foundation

protocol StartGameViewModelType {
    
    var chosenNumber: Box<String?> {get}
    
    var minBound: Int {get}
    var maxBound: Int {get}
    
    func viewModelForGame() -> GameViewModelType?
    
    func checkString(onInt text: String?) -> Bool
    
    
}


