//
//  ViewController.swift
//  demo app
//
//  Created by Jahnavi Gupta on 25/05/19.
//  Copyright © 2019 Jahnavi Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberOnscreen: Double = 0;
    var previousNumber: Double = 0;
    var performMath = false
    var operation = 0
    
    @IBOutlet weak var label: UILabel!
    @IBAction func numbers(_ sender: UIButton) {
        
        if performMath == true
        {
            if sender.tag == 18 //decimal
            {
                label.text = "."
                numberOnscreen = 0.0
            }
            else
            {
                label.text = String(sender.tag - 1)
                numberOnscreen = Double(label.text!)!
            }
            
            performMath = false
        }
        else
        {
            if sender.tag == 18 //decimal
            {
                label.text = label.text! + "."
            }
            else
            {
                label.text = label.text! + String(sender.tag - 1)
            }
            numberOnscreen = Double(label.text!)!
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        
        if label.text != "" && sender.tag != 17 && sender.tag != 15
        {
            previousNumber = Double(label.text!)!
            if sender.tag == 11 //divide
            {
                label.text = "/"
            }
            else if sender.tag == 12 //multiply
            {
                label.text = "x"
            }
            else if sender.tag == 13 //add
            {
                label.text = "+"
            }
            else if sender.tag == 14 //subtract
            {
                label.text = "-"
            }
            else if sender.tag == 19 //subtract
            {
                label.text = "%"
            }
            
            operation = sender.tag
            performMath = true
        }
        else if sender.tag == 15 //equals to
        {
            if operation == 11 //divide
            {
                label.text = String(previousNumber/numberOnscreen)
            }
            else if operation == 12 //multiply
            {
                label.text = String(previousNumber*numberOnscreen)
            }
            else if operation == 13 //add
            {
               label.text = String(previousNumber+numberOnscreen)
            }
            else if operation == 14 //subtract
            {
                label.text = String(previousNumber-numberOnscreen)
            }
            else if operation == 19 //subtract
            {
                label.text = String(previousNumber.truncatingRemainder(dividingBy: numberOnscreen))
            }
            //previousNumber = Double(label.text!)!
            //performMath = false
        }
       
        else if sender.tag == 17 //delete
        {
            label.text = String((label.text)!.dropLast())
            if (label.text)!.last == "."
            {
                label.text = String((label.text)!.dropLast())
            }
        }
    }
    
    @IBAction func clear(_ sender: UIButton) { //clear all or reset
        
        label.text = ""
        previousNumber = 0
        operation = 0
        numberOnscreen = 0
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
