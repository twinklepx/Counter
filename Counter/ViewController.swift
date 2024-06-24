//
//  ViewController.swift
//  Counter
//
//  Created by Polina on 22/06/2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var increaseValueButton: UIButton!
    @IBOutlet private weak var decreaseButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    @IBOutlet private weak var listOfChangesTextView: UITextView!
    
    private var value = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countLabel.text = "Значение счётчика: \(value)"
    }
    
    private func updateTextView(newText: String) {
        let currentText = listOfChangesTextView.text ?? ""
        let updatedText = currentText + "\n" + newText
        listOfChangesTextView.text = updatedText

        let range = NSRange(location: updatedText.count - 1, length: 1)
        listOfChangesTextView.scrollRangeToVisible(range)
    }
    
    @IBAction private func buttonIncreaseValueTap(_ sender: Any) {
        value += 1
        countLabel.text = "Значение счётчика: \(value)"
        updateTextView(newText: "\(Date().formatted()): значение изменено на +1")
    }
    
    @IBAction private func buttonDecreaseValueTap(_ sender: Any) {
        if value == 0 {
            updateTextView(newText: "\(Date().formatted()): попытка уменьшить значение счëтчика ниже 0")
        } else {
            value -= 1
            countLabel.text = "Значение счётчика: \(value)"
            updateTextView(newText: "\(Date().formatted()): значение изменено на -1")
        }
    }
    
    @IBAction private func buttonResetValueTap(_ sender: Any) {
        value = 0
        countLabel.text = "Значение счётчика: \(value)"
        updateTextView(newText: "\(Date().formatted()): значение сброшено")
    }
}
