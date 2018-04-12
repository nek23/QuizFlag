//
//  QuizViewController.swift
//  QuizFlag
//
//  Created by Alex on 12.04.2018.
//  Copyright © 2018 Alex. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    var currentQuestion: Question?
    var currentPositionQuestion = 0
    var numberCorrectAnswers = 0
    
    @IBOutlet weak var imageFlag: UIImageView!
    
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestion = questions[0]
        setQuestion()
        // Do any additional setup after loading the view.
    }
    
    //MARK: Actions
    @IBAction func submitAnswer1(_ sender: UIButton) {
        checkAnswer(id: 0)
    }
    
    @IBAction func submitAnswer2(_ sender: UIButton) {
     checkAnswer(id: 1)

    }
    
    @IBAction func submitAnswer3(_ sender: UIButton) {
        checkAnswer(id: 2)

    }
    
    @IBAction func submitAnswer4(_ sender: UIButton) {
      checkAnswer(id: 3)

    }
    
    //MARK: Методы
    
    // проверяет правильность ответа
    func checkAnswer (id: Int){
        if (id == currentQuestion?.correctAnswer) {
            numberCorrectAnswers = numberCorrectAnswers + 1
        }
            loadNextQuestion()
    }
    
    // загружает новый вопрос, если вопросов нет, то переходит на страницу результатов
    func loadNextQuestion () {
        if (currentPositionQuestion + 1 < questions.count) {
            currentPositionQuestion = currentPositionQuestion + 1
            currentQuestion = questions[currentPositionQuestion]
            setQuestion()
        } else {
            performSegue(withIdentifier: "ShowResults", sender: nil)
        }
    }
    
    //Устанавливает ответы и флаги к текущему вопросу
    func setQuestion () {
        imageFlag.image = UIImage(named: (currentQuestion?.flagImageName)!)
        answerButton1.setTitle(currentQuestion?.answers[0], for: .normal)
        answerButton2.setTitle(currentQuestion?.answers[1], for: .normal)
        answerButton3.setTitle(currentQuestion?.answers[2], for: .normal)
        answerButton4.setTitle(currentQuestion?.answers[3], for: .normal)
        self.title = "\(currentPositionQuestion + 1) из \(questions.count)"
    }
    
    //Переход на страницу результатов и передача данных
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ShowResults") {
            let resultsViewController = segue.destination as! ResultsViewController
            resultsViewController.numberCorrectAnswers = numberCorrectAnswers
            resultsViewController.totalAnswers = questions.count
            
        }
    }
    

}
