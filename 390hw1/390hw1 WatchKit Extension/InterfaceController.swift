//
//  InterfaceController.swift
//  390hw1 WatchKit Extension
//
//  Created by Alex Hinkle on 9/22/15.
//  Copyright © 2015 Alex Hinkle. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController
{

    var num1 = 0
    var num2 = 0
    
    
    @IBOutlet var fibSeq: WKInterfaceLabel!
    @IBAction func buttonClicked()
    {
        if(num2 == 0)
        {
            self.fibSeq.setText("0")
            num2 = 1
        }
        else
        {
            self.fibSeq.setText("\(num2)")
            let temp = num2
            num2 = num2 + num1
            num1 = temp
        }
        
        
    }
    override func contextForSegueWithIdentifier(segueIdentifier: String) -> AnyObject?
    {
   
        return "\(self.num2)"
    }
    @IBAction func divideTheNum()
    {
        
        
    }
    
    override func awakeWithContext(context: AnyObject?)
    {
        super.awakeWithContext(context)
     
        // Configure interface objects here.
    }

    override func willActivate()
    {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate()
    {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
