//
//  FinishViewController.swift
//  GuessTheNumberApp
//
//  Created by Ярослав Акулов on 22.01.2022.
//

import UIKit

class FinishViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    
    var viewModel: FinishViewModelType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = viewModel?.result

    }

}
