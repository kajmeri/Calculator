//
//  ViewController.swift
//  Calculator
//
//  Created by Krishna Ajmeri on 9/17/19.
//  Copyright © 2019 Krishna Ajmeri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	//MARK: - Variable Declaration
	
	@IBOutlet weak var displayLabel: UILabel!
	
	private var isFinishedTyping = true
	
	private var displayValue: Double {
		get {
			guard let number = Double(displayLabel.text!) else {
				fatalError("Cannot convert to Double")
			}
			return number
		}
		set {
			displayLabel.text = String(newValue)
		}
	}
	
	private var calculator = CalculatorLogic()
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	//MARK: - Buttons Pressed Methods
	
	@IBAction func calcButtonPressed(_ sender: UIButton) {
		
		isFinishedTyping = true
		
		calculator.setNumber(displayValue)
		
		if let calcMethod = sender.currentTitle {
			if let result = calculator.calculate(symbol: calcMethod) {
				displayValue = result
			}
		}
	}
	
	@IBAction func numButtonPressed(_ sender: UIButton) {
		
		if let numValue = sender.currentTitle {
			if isFinishedTyping {
				displayLabel.text = numValue
				isFinishedTyping = false
			} else {
				if numValue == "." {
					if floor(displayValue) != displayValue {
						return
					}
				}
				
				displayLabel.text = displayLabel.text! + numValue
			}
		}
	}
}
