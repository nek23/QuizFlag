//
//  Question.swift
//  QuizFlag
//
//  Created by Alex on 12.04.2018.
//  Copyright © 2018 Alex. All rights reserved.
//

import Foundation
import GameplayKit

extension Array {
    func shuffled(using source: GKRandomSource) -> [Element] {
        return (self as NSArray).shuffled(using: source) as! [Element]
    }
    func shuffled() -> [Element] {
        return (self as NSArray).shuffled() as! [Element]
    }
}

struct Question {
    let question: String
    let imageName: String?
    let answers: [String]
    let correctAnswer: Int
}

var questions: [Question] = [
    //Париж
    Question(question: "Какой город является столицей Франции?", imageName: nil, answers: ["Париж", "Рим", "Берлин", "Лондон"], correctAnswer: 0),
    //Аргентина
    Question(question: "Флаг какого государства изображен на рисунке?", imageName: "ar", answers: ["Нигерия", "Франция", "Уругвай", "Аргентина"], correctAnswer: 3),
    //Оттава
    Question(question: "Какой город является столицей Канады?", imageName: nil, answers: ["Мельбурн", "Оттава", "Вашингтон", "Лиссабон"], correctAnswer: 1),
    //Бразилия
    Question(question: "Флаг какого государства изображен на рисунке?", imageName: "br", answers: ["Панама", "Бразилия", "ЮАР", "Германия"], correctAnswer: 1),
    //Бухарест
    Question(question: "Какой город является столицей Румынии?", imageName: nil, answers: ["Будапешт", "Бухарест", "Берлин", "Рим"], correctAnswer: 1),
    //Греция
    Question(question: "Флаг какого государства изображен на рисунке?", imageName: "gr", answers: ["Греция", "Грузия", "Румыния", "Ангола"], correctAnswer: 0),
    //Корея
    Question(question: "Флаг какого государства изображен на рисунке?", imageName: "kr", answers: ["Китай", "Южная Корея", "Вьетнам", "Малайзия"], correctAnswer: 1),
    //Брюссель
    Question(question: "Какой город является столицей Бельгии?", imageName: nil, answers: ["Стокгольм", "Париж", "Брюссель", "Берлин"], correctAnswer: 2),
    //Копенгаген
    Question(question: "Какой город является столицей Дании?", imageName: nil, answers: ["Осло", "Рим", "Хельсинки", "Копенгаген"], correctAnswer: 3),
   //Португалия
    Question(question: "Флаг какого государства изображен на рисунке?", imageName: "pt", answers: ["Испания", "Италия", "Португалия", "Бельгия"], correctAnswer: 2)
]

var shuffledQuestions = questions.shuffled()

