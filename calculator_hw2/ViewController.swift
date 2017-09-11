//
//  ViewController.swift
//  calculator_hw2
//
//  Created by Habib Sarbolandi on 9/8/17.
//  Copyright © 2017 Habib Sarbolandi. All rights reserved.
//
import UIKit
import Foundation

class ViewController: UIViewController {
    
    
    
    // References for objects
    @IBOutlet weak var finalAnswer: UILabel! // displays the final answer
    @IBOutlet weak var mathDone: UILabel! // displays each number and operation as it is written
    
    var operationString: String = ""; // variable to store numerical operational
    
    // action triggered with number buttons pressed (watched a tutorial on youtube for the function)
    @IBAction func numberButtons(_ sender: UIButton) {
        mathDone.text = mathDone.text! + String(sender.tag); // writes the number push
        }
    
    @IBAction func mathButtons(_ sender: UIButton) {
        if mathDone.text != "" && sender.tag != 10 && sender.tag != 15{ // this code prevents the user from putting a numerical operator in the blank label
            if sender.tag == 11 { //Divide
                operationString = " ÷ "; // assign division sign to string
                mathDone.text = mathDone.text! + operationString;
            }
                
            else if sender.tag == 12 { //Multiple
                operationString = " x "; // assign multiple sign to string
                mathDone.text = mathDone.text! + operationString;
            }
                
            else if sender.tag == 13 { //Substract
                operationString = " - "; // assign subtraction sign to string
                mathDone.text = mathDone.text! + operationString;
            }
    
            else if sender.tag == 14 { //Addition
                operationString = " + "; // assign addition sign to string
                mathDone.text = mathDone.text! + operationString;
            }
        }
        
        else if sender.tag != 10 && sender.tag != 15 { // this allows the user to place parathesis
            if sender.tag == 16 {  // first parathesis
                operationString = " (";
                 mathDone.text = mathDone.text! + operationString;
            }
            
            else if sender.tag == 17 {  // second parathesis
                operationString = ")";
                mathDone.text = mathDone.text! + operationString;
            }
            
        }
            
        else if sender.tag == 10 { // this clears the operation string and both (mathDOne nad final) labels on the screeen
            mathDone.text = "";
            finalAnswer.text = "";
            operationString = "";
            
        }
            
        else if sender.tag == 15 { // this begins calculating the number
            // This snippet of code was taken from stackoverflow and can be found here: https://stackoverflow.com/questions/24704028/nsexpression-calculator-in-swift
            let expressionMath = NSExpression(format: mathDone.text!)
            if let final = expressionMath.expressionValue(with: nil, context: nil) as? Double {
                finalAnswer.text = String(final); // this displays the final answer of the math used
            }else {
                finalAnswer.text = "Numerical Error";
            }
            
        }
        
        else if sender.tag == 18 { // add decimal
            operationString = ".";
            mathDone.text = mathDone.text! + operationString;
        }
        
        else if sender.tag == 19 { // change the sign of the number
            operationString = "-";
            mathDone.text = mathDone.text! + operationString;
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
