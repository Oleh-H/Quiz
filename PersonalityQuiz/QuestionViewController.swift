//  Created by Oleh Haistruk on 4/3/19.
//  Copyright © 2019 Oleh Haistruk. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var question1Label: UILabel!
    @IBOutlet weak var question2Label: UILabel!
    @IBOutlet weak var question3Label: UILabel!
    @IBOutlet weak var question4Label: UILabel!
    
    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var switch2: UISwitch!
    @IBOutlet weak var switch3: UISwitch!
    @IBOutlet weak var switch4: UISwitch!
    
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    
    var questionIndex: Int = 0 //question index number
    var answerChosen: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI(){
        navigationItem.title = questions[questionIndex].text
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        questionProgressView.setProgress(totalProgress, animated: true)
        updateStack(using: currentAnswers)
        
    }
    //labels set text
    func updateStack(using answers: [Answer]){
        question1Label.text = answers[0].text
        question2Label.text = answers[1].text
        question3Label.text = answers[2].text
        question4Label.text = answers[3].text
        switch1.isOn = false
        switch2.isOn = false
        switch3.isOn = false
        switch4.isOn = false
    }
    
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count{
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" {
            let resultsViewControler = segue.destination as! ResultsViewController
            resultsViewControler.responses = answerChosen
        }
    }
    
    //next question button pressed. anwer recorded to the array
    @IBAction func answerButtonPressed() {
        if switch1.isOn {
            answerChosen.append(0)
        }
        if switch2.isOn {
            answerChosen.append(1)
        }
        if switch3.isOn {
            answerChosen.append(2)
        }
        if switch4.isOn {
            answerChosen.append(3)
        }
        
        nextQuestion()
    }
    
    
    var questions: [Question] = [
        Question(text: "Настроение", answers: [
            Answer(text: "Я не чувствую себя расстроенным, печальным.", type: .depressionSymptomesAbsent),
            Answer(text: "Я расстроен.", type: .lightDepression),
            Answer(text: "Я все время расстроен и не могу от этого отключиться.", type: .mediumDepression),
            Answer(text: "Я настолько расстроен и несчастлив, что не могу это выдержать.", type: .hardDepression)]),
        
        Question(text: "Пессимизм", answers: [
            Answer(text: "Я не тревожусь о своем будущем.", type: .depressionSymptomesAbsent),
            Answer(text: "Я чувствую, что озадачен будущим.", type: .lightDepression),
            Answer(text: "Я чувствую, что меня ничего не ждет в будущем.", type: .mediumDepression),
            Answer(text: "Мое будущее безнадежно, и ничто не может измениться к лучшему.", type: .hardDepression)]),
        
        Question(text: "Чувство несостоятельности", answers: [
            Answer(text: "Я не чувствую себя неудачником.", type: .depressionSymptomesAbsent),
            Answer(text: "Я чувствую, что терпел больше неудач, чем другие люди.", type: .lightDepression),
            Answer(text: "Когда я оглядываюсь на свою жизнь, я вижу в ней много неудач.", type: .mediumDepression),
            Answer(text: "Я чувствую, что как личность я - полный неудачник.", type: .hardDepression)]),
        
        Question(text: "Неудовлетворенность", answers: [
            Answer(text: "Я получаю столько же удовлетворения от жизни, как раньше.", type: .depressionSymptomesAbsent),
            Answer(text: "Я не получаю столько же удовлетворения от жизни, как раньше.", type: .lightDepression),
            Answer(text: "Я больше не получаю удовлетворения ни от чего.", type: .mediumDepression),
            Answer(text: "Я полностью не удовлетворен жизнью. и мне все надоело.", type: .hardDepression)]),
        
        Question(text: "Чувство вины", answers: [
            Answer(text: "Я не чувствую себя в чем-нибудь виноватым.", type: .depressionSymptomesAbsent),
            Answer(text: "Достаточно часто я чувствую себя виноватым.", type: .lightDepression),
            Answer(text: "Большую часть времени я чувствую себя виноватым.", type: .mediumDepression),
            Answer(text: "Я постоянно испытываю чувство вины.", type: .hardDepression)]),
        
        Question(text: "Ощущение, что буду наказан", answers: [
            Answer(text: "Я не чувствую, что могу быть наказанным за что-либо.", type: .depressionSymptomesAbsent),
            Answer(text: "Я чувствую, что могу быть наказан.", type: .lightDepression),
            Answer(text: "Я ожидаю, что могу быть наказан.", type: .mediumDepression),
            Answer(text: "Я чувствую себя уже наказанным.", type: .hardDepression)]),
    
        Question(text: "Отвращение к самому себе", answers: [
            Answer(text: "Я не разочаровался в себе.", type: .depressionSymptomesAbsent),
            Answer(text: "Я разочаровался в себе.", type: .lightDepression),
            Answer(text: "Я себе противен.", type: .mediumDepression),
            Answer(text: "Я себя ненавижу.", type: .hardDepression)]),
    
        Question(text: "Идеи самообвинения", answers: [
            Answer(text: "Я знаю, что я не хуже других.", type: .depressionSymptomesAbsent),
            Answer(text: "Я критикую себя за ошибки и слабости.", type: .lightDepression),
            Answer(text: "Я все время обвиняю себя за свои поступки.", type: .mediumDepression),
            Answer(text: "Я виню себя во всем плохом, что происходит.", type: .hardDepression)]),
    
        Question(text: "Суицидальные мысли", answers: [
            Answer(text: "Я никогда не думал покончить с собой.", type: .depressionSymptomesAbsent),
            Answer(text: "Ко мне приходят мысли покончить с собой, но я не буду их осуществлять.", type: .lightDepression),
            Answer(text: "Я хотел бы покончить с собой.", type: .mediumDepression),
            Answer(text: "Я бы убил себя, если бы представился случай.", type: .hardDepression)]),
    
        Question(text: "Слезливость", answers: [
            Answer(text: "Я плачу не больше, чем обычно.", type: .depressionSymptomesAbsent),
            Answer(text: "Сейчас я плачу чаще, чем раньше.", type: .lightDepression),
            Answer(text: "Теперь я все время плачу.", type: .mediumDepression),
            Answer(text: "Раньше я мог плакать, а сейчас не могу, даже если мне хочется.", type: .hardDepression)]),
    
        Question(text: "Раздражительность", answers: [
            Answer(text: "Сейчас я раздражителен не более, чем обычно.", type: .depressionSymptomesAbsent),
            Answer(text: "Я более легко раздражаюсь, чем раньше.", type: .lightDepression),
            Answer(text: "Теперь я постоянно чувствую, что раздражен.", type: .mediumDepression),
            Answer(text: "Я стал равнодушен к вещам, которые меня раньше раздражали.", type: .hardDepression)]),
    
        Question(text: "Нарушение социальных связей", answers: [
            Answer(text: "Я не утратил интереса к другим людям.", type: .depressionSymptomesAbsent),
            Answer(text: "Я меньше интересуюсь другими людьми, чем раньше.", type: .lightDepression),
            Answer(text: "Я почти потерял интерес к другим людям.", type: .mediumDepression),
            Answer(text: "Я полностью утратил интерес к другим людям.", type: .hardDepression)]),
    
        Question(text: "Нерешительность", answers: [
            Answer(text: "Я откладываю принятие решения иногда, как и раньше.", type: .depressionSymptomesAbsent),
            Answer(text: "Я чаще, чем раньше, откладываю принятие решения.", type: .lightDepression),
            Answer(text: "Мне труднее принимать решения, чем раньше.", type: .mediumDepression),
            Answer(text: "Я больше не могу принимать решения.", type: .hardDepression)]),
    
        Question(text: "Образ тела", answers: [
            Answer(text: "Я не чувствую, что выгляжу хуже, чем обычно.", type: .depressionSymptomesAbsent),
            Answer(text: "Меня тревожит, что я выгляжу старым и непривлекательным.", type: .lightDepression),
            Answer(text: "Я знаю, что в моей внешности произошли существенные изменения, делающие меня непривлекательным.", type: .mediumDepression),
            Answer(text: "Я знаю, что выгляжу безобразно.", type: .hardDepression)]),
    
        Question(text: "Утрата работоспособности", answers: [
            Answer(text: "Я могу работать так же хорошо, как и раньше.", type: .depressionSymptomesAbsent),
            Answer(text: "Мне необходимо сделать дополнительное усилие, чтобы начать делать что-нибудь.", type: .lightDepression),
            Answer(text: "Я с трудом заставляю себя делать что-либо.", type: .mediumDepression),
            Answer(text: "Я совсем не могу выполнять никакую работу.", type: .hardDepression)]),
    
        Question(text: "Нарушение сна", answers: [
            Answer(text: "Я сплю так же хорошо, как и раньше.", type: .depressionSymptomesAbsent),
            Answer(text: "Сейчас я сплю хуже, чем раньше.", type: .lightDepression),
            Answer(text: "Я просыпаюсь на 1-2 часа раньше, и мне трудно заснуть опять.", type: .mediumDepression),
            Answer(text: "Я просыпаюсь на несколько часов раньше обычного и больше не могу заснуть.", type: .hardDepression)]),
    
        Question(text: "Утомляемость", answers: [
            Answer(text: "Я устаю не больше, чем обычно.", type: .depressionSymptomesAbsent),
            Answer(text: "Теперь я устаю быстрее, чем раньше.", type: .lightDepression),
            Answer(text: "Я устаю почти от всего, что я делаю.", type: .mediumDepression),
            Answer(text: "Я не могу ничего делать из-за усталости.", type: .hardDepression)]),
    
        Question(text: "Утрата аппетита", answers: [
            Answer(text: "Мой аппетит не хуже, чем обычно.", type: .depressionSymptomesAbsent),
            Answer(text: "Мой аппетит стал хуже, чем раньше.", type: .lightDepression),
            Answer(text: "Мой аппетит теперь значительно хуже.", type: .mediumDepression),
            Answer(text: "У меня вообще нет аппетита.", type: .hardDepression)]),
    
        Question(text: "Потеря веса", answers: [
            Answer(text: "В последнее время я не похудел или потеря веса была незначительной.", type: .depressionSymptomesAbsent),
            Answer(text: "За последнее время я потерял более 2 кг.", type: .lightDepression),
            Answer(text: "Я потерял более 5 кг.", type: .mediumDepression),
            Answer(text: "Я потерял более 7 кr. (Я намеренно стараюсь похудеть и ем меньше)", type: .hardDepression)]),
    
        Question(text: "Охваченность телесными ощущениями", answers: [
            Answer(text: "Я беспокоюсь о своем здоровье не больше, чем обычно.", type: .depressionSymptomesAbsent),
            Answer(text: "Меня тревожат проблемы моего физического здоровья, такие, как боли, расстройство желудка, запоры и т.д.", type: .lightDepression),
            Answer(text: "Я очень обеспокоен своим физическим состоянием, и мне трудно думать о чем-либо другом.", type: .mediumDepression),
            Answer(text: "Я настолько обеспокоен своим физическим состоянием, что больше ни о чем не могу думать.", type: .hardDepression)]),
    
        Question(text: "Утрата либидо", answers: [
            Answer(text: "В последнее время я не замечал изменения своего интереса к сексу.", type: .depressionSymptomesAbsent),
            Answer(text: "Меня меньше занимают вопросы секса, чем раньше.", type: .lightDepression),
            Answer(text: "Сейчас я значительно меньше интересуюсь сексуальными вопросами, чем раньше.", type: .mediumDepression),
            Answer(text: "Я полностью утратил сексуальный интерес.", type: .hardDepression)])]

}
