//
//  ViewController.swift
//  calc
//
//  Created by Маргарита on 14.08.2022.
//

import UIKit
class ViewController: UIViewController {
    
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var performingMath = false
    var afterPercVal: Double = 0
    var minusNmbr: Double = 0
    var minusStat = false
    var operation = 0
    var currentVal: Double = 0
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true
        {
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
            
        }
        else
        {
            
            label.text = label.text! + String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
        }
    }
    
    @IBAction func minusnumb(_ sender: UIButton)
    {
        
            minusNmbr = -1*numberOnScreen
           label.text = String(minusNmbr)
        if operation == 17{
            label.text = String(-previousNumber)
        }

    }
    
    @IBAction func percent(_ sender: UIButton)
    {
        afterPercVal = previousNumber/100
        label.text = String(previousNumber/100)
    }
    
    @IBAction func operations(_ sender: UIButton) {
        if label.text != "" && sender.tag != 16
        {
            previousNumber = Double(label.text!)!
            if sender.tag == 12
            {
                label.text = "/"
                
            }
            else if sender.tag == 13
            {
                label.text = "x"
                
            }
            else if sender.tag == 14
            {
                label.text = "-"
            }
            
            else if sender.tag == 15
            {
                label.text = "+"
            }
            operation = sender.tag
            performingMath = true
        }
        else if sender.tag == 16 {
            if operation == 12
            {
                label.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 13
            {
                label.text = String(previousNumber * numberOnScreen)

            }
            else if operation == 14
            {
                label.text = String(previousNumber - numberOnScreen)

            }
            else if operation == 15
            {
                label.text = String(previousNumber + numberOnScreen)
            }

           
        }
    }
    @IBAction func cancel(_ sender: UIButton) {
        label.text = ""
        numberOnScreen = 0;
        previousNumber = 0;
        operation = 0;
    }
    
        
    @IBAction func comaPrssdBtn(_ sender: UIButton){
        var dotIsPlaced = false
        if sender.tag == 20 && !dotIsPlaced {
             label.text = String(numberOnScreen) + "."
             dotIsPlaced = true
        } else if !dotIsPlaced {
             label.text = "0."
           }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}


