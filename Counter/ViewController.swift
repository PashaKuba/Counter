//
//  ViewController.swift
//  Counter
//
//  Created by Павел Куба on 29.02.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var historyView: UITextView!
    
    var counter = 0 {
            didSet {
                counterLabel.text = "\(counter)"
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyView.text = "История изменений:"
        historyView.isEditable = false
    }

    func appendToHistory(_ entry: String) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let timestamp = dateFormatter.string(from: Date())
            
            historyView.text += "\n[\(timestamp)]: \(entry)"
            let range = NSMakeRange(historyView.text.count - 1, 1)
            historyView.scrollRangeToVisible(range)
        }
    
    @IBAction func incrementButton(_ sender: UIButton) {
        counter += 1
        appendToHistory("значение изменено на +1")
    }
    
    @IBAction func decrementButton(_ sender: UIButton) {
        if counter > 0 {
                    counter -= 1
                    appendToHistory("значение изменено на -1")
                } else {
                    appendToHistory("попытка уменьшить значение счётчика ниже 0")
                }
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        counter = 0
                appendToHistory("значение сброшено")
    }
    

}

