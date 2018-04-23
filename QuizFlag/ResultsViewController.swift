//
//  ResultsViewController.swift
//  QuizFlag
//
//  Created by Alex on 12.04.2018.
//  Copyright © 2018 Alex. All rights reserved.
//

import UIKit
import Social

extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}

class ResultsViewController: UIViewController {

    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var emojiLabel: UILabel!
    
    @IBOutlet weak var shareButton: UIButton!
    
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
        } else if resultInPersent.isNaN {
            resultLabel.text = "Вообще не играл даже"
            emojiLabel.text = "😵"
            levelLabel.isHidden = true
        }
        else {
            resultLabel.text = "Идеально, молодец"
            emojiLabel.text = "👍"
        }
    }
    
    @IBAction func share(_ sender: UIButton) {
      let alert = UIAlertController(title: "Поделиться", message: "Поделись результатом с друзьями!", preferredStyle: .actionSheet)
        //facebook
        let actionOne = UIAlertAction(title: "Share on Facebook", style: .default) { (action) in
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook)
            {
                let post = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
                
                post.setInitialText("Я ответил на \(self.numberCorrectAnswers) из \(self.totalAnswers) в приложении StudyArts")
                
                self.present(post, animated: true, completion: nil)
                
            } else {self.showAlert(service: "Facebook")}
        }
        //twitter
        let actionTwo = UIAlertAction(title: "Share on Twitter", style: .default) { (action) in
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter)
            {
                let post = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!

                post.setInitialText("Я ответил на \(self.numberCorrectAnswers) из \(self.totalAnswers) в приложении StudyArts")
              
                
                self.present(post, animated: true, completion: nil)
                
            } else {self.showAlert(service: "Twitter")}
        }
        
        let actionThree = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(actionOne)
        alert.addAction(actionTwo)
        alert.addAction(actionThree)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(service:String)
    {
        let alert = UIAlertController(title: "Error", message: "You are not connected to \(service)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
}
