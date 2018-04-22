//
//  TimeQuizViewController.swift
//  QuizFlag
//
//  Created by Alex on 22.04.2018.
//  Copyright © 2018 Alex. All rights reserved.
//

import UIKit
import GameplayKit

class TimeQuizViewController: UIViewController {
    
    var shuffledQuestions = questions.shuffled()
    
    //счетчик
    var counter = 60
    var timer = Timer()
    
    //ответы/вопросы
    var currentQuestion: Question?
    var currentPositionQuestion = 0
    var numberCorrectAnswers = 0
    var totalAnswers = 1
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionImage: UIImageView!
    
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    
    override func viewDidLoad() {
        self.title = "01-00"
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(timeToMoveOn), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        currentQuestion = shuffledQuestions[0]
        setQuestion()
    }
    
    @objc func timerAction() {
        counter -= 1
        if counter >= 10 {
            self.title = "00-\(counter)"
        } else {
            self.title = "00-0\(counter)"
        }
    }
    
    @objc func timeToMoveOn() {
        self.performSegue(withIdentifier: "ShowResults", sender: self)
    }
    
    //MARK: Actions
    @IBAction func submitAnswer1(_ sender: UIButton) {
        checkAnswer(id: 0)
        totalAnswers += 1
    }
    
    @IBAction func submitAnswer2(_ sender: UIButton) {
        checkAnswer(id: 1)
        totalAnswers += 1
    }
    
    @IBAction func submitAnswer3(_ sender: UIButton) {
        checkAnswer(id: 2)
        totalAnswers += 1
    }
    
    @IBAction func submitAnswer4(_ sender: UIButton) {
        checkAnswer(id: 3)
        totalAnswers += 1
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
        if (currentPositionQuestion + 1 < shuffledQuestions.count) {
            currentPositionQuestion = currentPositionQuestion + 1
            currentQuestion = shuffledQuestions[currentPositionQuestion]
            setQuestion()
        } else {
            performSegue(withIdentifier: "ShowResults", sender: nil)
        }
    }
    
    //Устанавливает ответы и флаги к текущему вопросу
    func setQuestion () {
        questionLabel.text = currentQuestion?.question
        if currentQuestion?.imageName != nil {
            questionImage.image = UIImage(named: (currentQuestion?.imageName)!)}
        else {
            questionImage.image = nil
        }
        answerButton1.setTitle(currentQuestion?.answers[0], for: .normal)
        answerButton2.setTitle(currentQuestion?.answers[1], for: .normal)
        answerButton3.setTitle(currentQuestion?.answers[2], for: .normal)
        answerButton4.setTitle(currentQuestion?.answers[3], for: .normal)
       
    }
    
    //Переход на страницу результатов и передача данных
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ShowResults") {
            let resultsViewController = segue.destination as! ResultsViewController
            resultsViewController.numberCorrectAnswers = numberCorrectAnswers
            resultsViewController.totalAnswers = totalAnswers
            
        }
    }
    
   
    
   
    
}
