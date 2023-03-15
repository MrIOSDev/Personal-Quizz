//
//  ViewController.swift
//  Personal Quizz
//
//  Created by admin on 06/03/2023.
//

import UIKit

class QuestionsViewController: UIViewController {
    
   
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var QuestionProgressView: UIProgressView!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLables: [UILabel]!
    @IBOutlet var multipleSliders: [UISwitch]!
    
    @IBOutlet var rangeStackView: UIStackView!
    @IBOutlet var rangeLables: [UILabel]!
    @IBOutlet var rangeSlide: UISlider! {
        didSet {
            let answerCount = Float(currentAnswers.count - 1)
            rangeSlide.maximumValue = answerCount
            rangeSlide.value = answerCount / 2
        }
    }
    
    private let questions = Question.getQuestions()
    private var answerChosen: [Answer] = []
    private var questionIndex = 0
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func singelButtonPressed(_ sender: UIButton) {
        guard let buttonIndex = singleButtons.firstIndex(of: sender) else {return}
        let answer = currentAnswers[buttonIndex]
        answerChosen.append(answer)
        nextQuestion()
    }
    
    @IBAction func multipleAnswerPressed(_ sender: UIButton) {
        for(multipleSwitch, answer) in zip(multipleSliders,currentAnswers ){
            if multipleSwitch.isOn {
                answerChosen.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangeAnswerPressed(_ sender: UIButton) {
        let index = lrintf(rangeSlide.value)
        
        answerChosen.append(currentAnswers[index])
        nextQuestion()
    }
    
}

extension QuestionsViewController {
    private func updateUI() {
        for stackView in [singleStackView, multipleStackView, rangeStackView] {
            stackView?.isHidden = true
        }
        let currentQuestion = questions[questionIndex]
        questionLabel.text = currentQuestion.title
        
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        QuestionProgressView.setProgress(totalProgress, animated: true)
        
        title = "Вопрос \(questionIndex + 1) из \(questions.count)"
        
        showCurrentAnswers(for:currentQuestion.type)
        
        
    }
  private func showCurrentAnswers(for type: ResponseType) {
       switch type {
       case .single: showSingleStackView(with: currentAnswers)
       case .multiple: showMultipleStackView(with: currentAnswers)
       case .range: showRangeStackView(with: currentAnswers)
       }
   }
    
   private func showSingleStackView(with answers: [Answer]) {
       singleStackView.isHidden = false
       
       for (button, answer) in zip(singleButtons, answers) {
           button.setTitle(answer.title, for: .normal)
       }
   }
    
    private func showMultipleStackView(with answers: [Answer]) {
        multipleStackView.isHidden = false
        for (label, answer) in zip(multipleLables, answers){
            label.text = answer.title
        }
    }
    
    private func showRangeStackView(with answers: [Answer]){
        rangeStackView.isHidden = false
        
        rangeLables.first?.text = answers.first?.title
        rangeLables.last?.text = answers.last?.title
    }
    
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
            return
        }
            performSegue(withIdentifier: "GoTo", sender: nil)
        }
    }

