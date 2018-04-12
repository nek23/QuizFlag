//
//  Question.swift
//  QuizFlag
//
//  Created by Alex on 12.04.2018.
//  Copyright © 2018 Alex. All rights reserved.
//

import Foundation

struct Question {
    let flagImageName: String
    let answers: [String]
    let correctAnswer: Int
}

var questions: [Question] = [
    Question(flagImageName: "ar", answers: ["Нигерия", "Франция", "Уругвай", "Аргентина"], correctAnswer: 3),
    Question(flagImageName: "br", answers: ["Панама", "Бразилия", "ЮАР", "Германия"], correctAnswer: 1),
    Question(flagImageName: "gr", answers: ["Греция", "Грузия", "Румыния", "Ангола"], correctAnswer: 0),
    Question(flagImageName: "kr", answers: ["Китай", "Южная Корея", "Вьетнам", "Малайзия"], correctAnswer: 1),
    Question(flagImageName: "pt", answers: ["Испания", "Италия", "Португалия", "Бельгия"], correctAnswer: 2)
]
