//  Created by Oleh Haistruk on 4/3/19.
//  Copyright © 2019 Oleh Haistruk. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var responses: [Int]!
    
    @IBOutlet weak var answerHeadLabel: UILabel!
    @IBOutlet weak var resultsDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculateQuizResult()
    }
    
    func calculateQuizResult() {
        var result: Int = 0
        for answer in responses {
            result += answer
        }
        
        switch result {
        case 0...9:
            answerHeadLabel.text = "😀"
            resultsDescriptionLabel.text = "Обнаружено отсутствие депрессивных симптомов!"
        case 10...15:
            answerHeadLabel.text = "🙂"
            resultsDescriptionLabel.text = "У вас легкая депрессия (субдепрессия)"
        case 16...19:
            answerHeadLabel.text = "🙁"
            resultsDescriptionLabel.text = "У вас умеренная депрессия"
        case 20...29:
            answerHeadLabel.text = "☹️"
            resultsDescriptionLabel.text = "У вас выраженная депрессия (средней тяжести)"
        case 30...63:
            answerHeadLabel.text = "😩"
            resultsDescriptionLabel.text = "У вас тяжелая депрессия. Вам Нужна помощь!"
        default:
            answerHeadLabel.text = "🤪"
            resultsDescriptionLabel.text = "Что-то пошло не так!"
        }
        print(result)
    }
}
