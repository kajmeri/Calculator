//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Krishna Ajmeri on 9/17/19.
//  Copyright © 2019 Krishna Ajmeri. All rights reserved.
//

import UIKit

struct CalculatorLogic {
	private var number: Double?
	
	private var intermediateCalc: (n1: Double, calcMethod: String)?
	
	mutating func setNumber(_ number: Double) {
		self.number = number
	}
	
	mutating func calculate(symbol: String) -> Double? {
		if let n = number {
			switch symbol {
			case "AC":
				return 0
			case "+/-":
				return n * -1
			case "%":
				return n / 100
			case "=":
				return performTwoNumCalc(n2: n)
			default:
				intermediateCalc = (n1: n, calcMethod: symbol)
			}
		}
		return nil
	}
	
	private func performTwoNumCalc(n2: Double) -> Double? {
		if let n1 = intermediateCalc?.n1,
			let operation = intermediateCalc?.calcMethod {
			
			switch operation {
			case "+":
				return n1 + n2
			case "-":
				return n1 - n2
			case "×":
				return n1 * n2
			case "÷":
				return n1 / n2
			default:
				fatalError("Operation does not match any cases")
			}
		}
		return nil
	}
}
