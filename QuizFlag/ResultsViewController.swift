//
//  ResultsViewController.swift
//  QuizFlag
//
//  Created by Alex on 12.04.2018.
//  Copyright © 2018 Alex. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var emojiLabel: UILabel!
    
    var numberCorrectAnswers = 0
    var totalAnswers = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Результат"
        self.navigationItem.setHidesBackButton(true, animated: true)
        levelLabel.text = "Ты ответил на \(numberCorrectAnswers) из \(totalAnswers) вопросов"
        
        let resultInPersent = ((Double(numberCorrectAnswers) / Double(totalAnswers)) * 100)
        if resultInPersent < 40 {
            resultLabel.text = "Неплохой результат, но можно и лучше"
            emojiLabel.text = "😕"
        } else if resultInPersent <= 80 {
            resultLabel.text = "Хороший результат, почти"
            emojiLabel.text = "🙂"
        } else {
            resultLabel.text = "Идеально, молодец"
            emojiLabel.text = "👍"
        }
    }
}
