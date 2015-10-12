//
//  MainScreenIC.swift
//  DiceRoller
//
//  Created by Alex Hinkle on 10/7/15.
//  Copyright © 2015 Alex Hinkle. All rights reserved.
//

import WatchKit
import Foundation


class MainScreenIC: WKInterfaceController
{
    let alert = WKAlertAction(title: "Ok", style: WKAlertActionStyle.Cancel, handler: { () -> Void in
    })
    let sides = [4,6,8,10,12,20,100]
    
    @IBOutlet var theTable: WKInterfaceTable!

    override func awakeWithContext(context: AnyObject?)
    {
        super.awakeWithContext(context)
        
        let prefs = NSUserDefaults.standardUserDefaults()
        let theDiceStrings = prefs.valueForKey("theDiceStrings")
        if(theDiceStrings != nil)
        {
            let vals = theDiceStrings as! NSArray
            for s in vals
            {
                DiceRollerMain.theRolls.append(Roll(rollString: s as! String))
            }
            self.generateTable()
        }
        
        

        
        
        // Configure interface objects here.
    }
    
    
    func generateTable()
    {
        self.theTable.setNumberOfRows(DiceRollerMain.theRolls.count, withRowType: "cell")
        for( var i = 0; i < DiceRollerMain.theRolls.count; i++)
        {
            let currRow = self.theTable.rowControllerAtIndex(i) as! rollRow
            currRow.qtyLabel.setText("\(DiceRollerMain.theRolls[i].qty)")
            currRow.sidesLabel.setText("D"+"\(DiceRollerMain.theRolls[i].numSides)")
        }

    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int)
    {
        for(var i = 0; i <= DiceRollerMain.numDice; i++)
        {
        self.presentAlertControllerWithTitle("The Roll", message: "\(rand()%Int32(self.sides[rowIndex]+1))", preferredStyle: WKAlertControllerStyle.Alert, actions: [alert])
        }
    }

   

    override func willActivate() {
        
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        if(DiceRollerMain.hasDice)
        {
            DiceRollerMain.theRolls.append(Roll(qty: DiceRollerMain.numDice, numSides: DiceRollerMain.numSides))
            DiceRollerMain.resetValues()
            
            var theDiceStrings = [String]()
            for(var i = 0; i < DiceRollerMain.theRolls.count; i++)
            {
                theDiceStrings.append(DiceRollerMain.theRolls[i].toString())
                
            }
            
            let prefs = NSUserDefaults.standardUserDefaults()
            prefs.setObject(theDiceStrings, forKey: "theDiceStrings")
            
            
            
            self.generateTable()
            
            
            
            
        }
       
    
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
