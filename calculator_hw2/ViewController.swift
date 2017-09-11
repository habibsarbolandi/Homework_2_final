//
//  ViewController.swift
//  calculator_hw2
//
//  Created by Habib Sarbolandi on 9/8/17.
//  Copyright © 2017 Habib Sarbolandi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberScreen:Double = 0;
    var numberPrevious: Double = 0;
    var doingMath = false;
    var operationString: String = "";
    var screenNumber: String = "";
    
    
    
    // References for objects
    @IBOutlet weak var finalAnswer: UILabel!
    @IBOutlet weak var mathDone: UILabel!
    
    // action triggered with number buttons pressed (watched a tutorial on youtube for the function)
    @IBAction func numberButtons(_ sender: UIButton) {
        
        if doingMath == true {
            screenNumber = Strig
            mathDone.text = mathDone.text! + String(sender.tag);
            numberScreen = Double(sender.tag);
            doingMath = false
        }
            
        else {
            mathDone.text = mathDone.text! + String(sender.tag);
        
        if numberScreen != 0 {
            screenNumber = String(numberScreen) + String(sender.tag);
            numberScreen = Double(screenNumber)!;
            }
            
        else if numberScreen == 0 {
            screenNumber = String(sender.tag);
            numberScreen = Double(screenNumber)!;
            }
        }
    }
    
    @IBAction func mathButtons(_ sender: UIButton) {
        if mathDone.text != "" && sender.tag != 10 && sender.tag != 15{
            
            numberPrevious = numberScreen;
            
            if sender.tag == 11 { //Divide
                
            }
            
            else if sender.tag == 12 { //Multiple
                
            }
                
            else if sender.tag == 13 { //Substract
                
            }
                
            else if sender.tag == 14 { //Addition
                operationString = " + ";
                mathDone.text = " \(numberPrevious) \(operationString)";
            }
            
            else if sender.tag == 17 { // Sign change
                
            }
            
            doingMath = true;
            
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

