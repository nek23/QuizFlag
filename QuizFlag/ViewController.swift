//
//  ViewController.swift
//  QuizFlag
//
//  Created by Alex on 12.04.2018.
//  Copyright © 2018 Alex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var aboutUsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newGameButton.layer.cornerRadius = 5.0
        aboutUsButton.layer.cornerRadius = 5.0
        
    }

    @IBAction func newGameButtonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.newGameButton.transform = CGAffineTransform(scaleX: 2.5, y: 2.5)
            self.newGameButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }

    }

    @IBAction func aboutUsButtonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.aboutUsButton.transform = CGAffineTransform(scaleX: 2.5, y: 2.5)
            self.aboutUsButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }

    }

    @IBAction func unwindToNewGame(unwindSegue: UIStoryboardSegue) {
    }

}

