//
//  GameViewModelType.swift
//  GuessTheNumberApp
//
//  Created by Ярослав Акулов on 22.01.2022.
//

import Foundation

protocol GameViewModelType {
    
    var playerAnswer: Box<String?> {get}
    
    var chosenNumber: String {get}
    var roundNumber: Int {get}
    var guesser: Guesser {get}
    var computerAnswer: String {get}
    
    func moreAnswer()
    func lessAnswer()
    func checkString(onInt text: String?) -> Bool
    func returnResult() -> Valid?
    func validateAnswer(parameter: Valid) -> Bool
    
    func viewModelForFinish(with result: String) -> FinishViewModelType?
    
    
    
}
