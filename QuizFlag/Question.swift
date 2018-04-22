//
//  Question.swift
//  QuizFlag
//
//  Created by Alex on 12.04.2018.
//  Copyright © 2018 Alex. All rights reserved.
//

import Foundation

struct Question {
    let question: String
    let imageName: String?
    let answers: [String]
    let correctAnswer: Int
}

var questions: [Question] = [
    
    Question(question: "Какой город является столицей Франции?", imageName: nil, answers: ["Париж", "Рим", "Берлин", "Лондон"], correctAnswer: 0),
    Question(question: "Какой город является столицей Канады?", imageName: nil, answers: ["Мельбурн", "Оттава", "Вашингтон", "Лиссабон"], correctAnswer: 1),
    Question(question: "Какой город является столицей Румынии?", imageName: nil, answers: ["Будапешт", "Бухарест", "Берлин", "Рим"], correctAnswer: 1),
    Question(question: "Какой город является столицей Бельнии?", imageName: nil, answers: ["Стокгольм", "Париж", "Брюссель", "Берлин"], correctAnswer: 2),
    Question(question: "Какой город является столицей Дании?", imageName: nil, answers: ["Осло", "Рим", "Хельсинки", "Копенгаген"], correctAnswer: 0),
    Question(question: "Флаг какого государства изображен на рисунке?", imageName: "ar", answers: ["Нигерия", "Франция", "Уругвай", "Аргентина"], correctAnswer: 3),
    Question(question: "Флаг какого государства изображен на рисунке?",imageName: "br", answers: ["Панама", "Бразилия", "ЮАР", "Германия"], correctAnswer: 1),
    Question(question: "Флаг какого государства изображен на рисунке?", imageName: "gr", answers: ["Греция", "Грузия", "Румыния", "Ангола"], correctAnswer: 0),
    Question(question: "Флаг какого государства изображен на рисунке?", imageName: "kr", answers: ["Китай", "Южная Корея", "Вьетнам", "Малайзия"], correctAnswer: 1),
    Question(question: "Флаг какого государства изображен на рисунке?", imageName: "pt", answers: ["Испания", "Италия", "Португалия", "Бельгия"], correctAnswer: 2)
    
    
]
