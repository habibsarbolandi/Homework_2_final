//
//  ViewController.swift
//  calculator_hw2
//
//  Created by Habib Sarbolandi on 9/8/17.
//  Copyright © 2017 Habib Sarbolandi. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    var numberScreen: Double = 0;
    var numberPrevious: Double = 0;
    var doingMath = false;
    var operationString: String = "";
    var screenNumber: String = "";
    var operation = 0;
    var negativeNumber1 = false;
    var negativeNumber2 = false;
    
    
    // References for objects
    @IBOutlet weak var finalAnswer: UILabel!
    @IBOutlet weak var mathDone: UILabel!
    
    // action triggered with number buttons pressed (watched a tutorial on youtube for the function)
    @IBAction func numberButtons(_ sender: UIButton) {
        
        if doingMath == true {
            screenNumber = "";
            screenNumber = screenNumber + String(sender.tag);
            numberScreen = Double(screenNumber)!
            
            mathDone.text = mathDone.text! + String(sender.tag);
            doingMath = false
        }
            
        else {
            screenNumber = screenNumber + String(sender.tag);
            numberScreen = Double(screenNumber)!
            
            mathDone.text = mathDone.text! + String(sender.tag);
        }
    }
    
    
    // this changes the shows the negative sign on the mathDone labeel
    @IBAction func changSign(_ sender: UIButton) {
        mathDone.text = mathDone.text! + " -"
        
        // this function allows the user to input numbers after the negative sign
        func numberButtons(_ sender: UIButton) {
            
            if doingMath == true {
                screenNumber = "";
                screenNumber = screenNumber + String(sender.tag);
                numberScreen = Double(screenNumber)!
                
                mathDone.text = mathDone.text! + String(sender.tag);
                doingMath = false
            }
                
            else {
                screenNumber = screenNumber + String(sender.tag);
                numberScreen = Double(screenNumber)!
                
                mathDone.text = mathDone.text! + String(sender.tag);
            }
        }
        
        // shows the number is negative
        if numberPrevious == 0 {
            negativeNumber1 = true;
        }
        
        else if numberPrevious != 0 {
            negativeNumber2 = true;
        }
        
    }
    
    
    // this displays the operation command the user wishes to use
    @IBAction func mathButtons(_ sender: UIButton) {
        if mathDone.text != "" && sender.tag != 10 && sender.tag != 15{
            
            numberPrevious = numberScreen;
            
            if sender.tag == 11 { //Divide
                operationString = " ÷ ";
                mathDone.text = mathDone.text! + operationString;
            }
                
            else if sender.tag == 12 { //Multiple
                operationString = " x ";
                mathDone.text = mathDone.text! + operationString;
            }
                
            else if sender.tag == 13 { //Substract
                operationString = " - ";
                mathDone.text = mathDone.text! + operationString;
            }
                
            else if sender.tag == 14 { //Addition
                operationString = " + ";
                mathDone.text = mathDone.text! + operationString;
                
            }
            
            operation = sender.tag // asigns value pushed to operation
            doingMath = true; // shows we are doing math
        }
            
        // this is used to when the user pushes the equal sign
        else if sender.tag == 15 {
            
            if operation == 11 { // Division
                if negativeNumber1 == true {
                    numberPrevious = -numberPrevious;
                }
                else if negativeNumber2 == true {
                    numberScreen = -numberScreen;
                }
                
                finalAnswer.text = String( numberPrevious / numberScreen);
            }
                
            else if operation == 12 { // Multiplication
                if negativeNumber1 == true {
                    numberPrevious = -numberPrevious;
                }
                else if negativeNumber2 == true {
                    numberScreen = -numberScreen;
                }
                
                finalAnswer.text = String( numberPrevious * numberScreen);
            }
                
            else if operation == 13 { // Subtraction
                if negativeNumber1 == true {
                    numberPrevious = -numberPrevious;
                }
                else if negativeNumber2 == true {
                    numberScreen = -numberScreen;
                }
                
                finalAnswer.text = String( numberPrevious - numberScreen);
            }
                
            else if operation == 14 { // Addition
                if negativeNumber1 == true {
                    numberPrevious = -numberPrevious;
                }
                else if negativeNumber2 == true {
                    numberScreen = -numberScreen;
                }
                
                finalAnswer.text = String( numberPrevious + numberScreen);
            }
        }
            
        else if sender.tag == 10 {
            mathDone.text = "";
            finalAnswer.text = "";
            numberPrevious = 0;
            numberScreen = 0;
            operation = 0;
            operationString = "";
            screenNumber = "";
            
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
