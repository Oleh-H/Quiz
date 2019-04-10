//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by Oleh Haistruk on 4/4/19.
//  Copyright © 2019 Oleh Haistruk. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var answers: [Answer]
}

struct Answer {
    var text: String
    var type: MoodType
}

enum MoodType: String {
    case depressionSymptomesAbsent = "😀", lightDepression = "🙂", mediumDepression = "🙁", severeDepression = "☹️", hardDepression = "😩"
    var definition: String {
        switch self {
        case .depressionSymptomesAbsent:
            return "Відсутність депресивних симптомів."
        case .lightDepression:
            return "Легка депресія (Субдипресія)."
        case .mediumDepression:
            return "Помірна дипресія."
        case .severeDepression:
            return "Виражена дипресія (Середньої тяжкості)."
        case .hardDepression:
            return "Тяжка дипресія."
        }
    }
}
