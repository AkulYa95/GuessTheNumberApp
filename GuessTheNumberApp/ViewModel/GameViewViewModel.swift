//
//  GameViewViewModelType.swift
//  GuessTheNumberApp
//
//  Created by Ярослав Акулов on 22.01.2022.
//

import Foundation

class GameViewViewModel: GameViewModelType {

    var playerAnswer: Box<String?>
    
    var guesser: Guesser
    
    var roundNumber: Int
    
    var chosenNumber: String
    
    init(chosenNumber: String, minBound: Int, maxBound: Int) {
        self.chosenNumber = chosenNumber
        self.minBound = minBound
        self.maxBound = maxBound
        self.roundNumber = 1
        self.guesser = .computer
        self.playerAnswer = Box(nil)
        self.computerAnswer = String(Int.random(in: minBound...maxBound))
    }
    
    var minBound: Int
    
    var maxBound: Int
    
    var computerAnswer: String
    
    func generateRandomNumber() -> String {
        let randomNumber = Int.random(in: minBound...maxBound)
        return String(describing: randomNumber)
    }
    
    func moreAnswer() {
        guard let answer = Int(computerAnswer) else {return}
        maxBound = answer - 1
        changeGuesser()
        print(computerAnswer)
        print(minBound, maxBound)
    }

    func lessAnswer() {
        guard let answer = Int(computerAnswer) else {return}
        minBound = answer + 1
        changeGuesser()
        print(computerAnswer)
        print(minBound, maxBound)
    }
    
    func validateAnswer(parameter: Valid ) -> Bool {
        guard let answer = Int(computerAnswer) else {return false}
        guard let chosenNumber = Int(chosenNumber) else {return false}
        var isValid: Valid
        if answer < chosenNumber {
            isValid = .less
        } else if answer > chosenNumber {
            isValid = .more
        } else {
            isValid = .equal
        }
        return isValid == parameter
    }
            
    func changeGuesser() {
        switch guesser {
        case .computer:
            guesser = .player
        case .player:
            guesser = .computer
            roundNumber += 1
            computerAnswer = generateRandomNumber()
        }
    }
    
    func checkString(onInt text: String?) -> Bool {
        guard let text = text, let _ = Int(text) else {return false}
        return true
    }
    
    func returnResult() -> Valid? {
        guard let playerAnswer = playerAnswer.value,
              let numericAnswer = Int(playerAnswer),
              let chosenNumber = Int(chosenNumber) else {return nil}
        if numericAnswer > chosenNumber {
            changeGuesser()
            return Valid.more
        } else if numericAnswer < chosenNumber {
            changeGuesser()
            return Valid.less
        } else {
            return Valid.equal
        }
    }
    
    func viewModelForFinish(with result: String) -> FinishViewModelType? {
        return FinishViewViewModel(result: result)
    }
    
}

