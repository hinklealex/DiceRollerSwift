//
//  page2.swift
//  390hw1
//
//  Created by Alex Hinkle on 9/23/15.
//  Copyright © 2015 Alex Hinkle. All rights reserved.
//

import WatchKit
import Foundation


class page2: WKInterfaceController
{

    
    @IBOutlet var theAnswerLabel: WKInterfaceLabel!
    override func awakeWithContext(context: AnyObject?)
    {
        super.awakeWithContext(context)
        let theValue = Int(context as! String)
        for(var i = (theValue!-1); i >= 1; i--)
        {
            if(theValue! % 1 == 0)
            {
                self.theAnswerLabel.setText("\(i)")
                break
            }
        }
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
