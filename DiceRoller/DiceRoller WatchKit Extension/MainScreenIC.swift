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
    let rollAlert = WKAlertAction(title: "Ok", style: WKAlertActionStyle.Cancel, handler: { () -> Void in
    })
    let deleteAlertCancel = WKAlertAction(title: "Cancel", style: WKAlertActionStyle.Cancel, handler: { () -> Void in print("cancel Delete")
    })
    let deleteAlertConfrim = WKAlertAction(title: "Confirm", style: WKAlertActionStyle.Cancel, handler: { () -> Void in
        
        //Delete from rolls 
       // DiceRollerMain.theRolls.removeAtIndex(???)
        //self.updateUserDefults()
        //self.generateTable()
        
    })
    
    
    
    let sides = [4,6,8,10,12,20,100]
    
    @IBOutlet var theTable: WKInterfaceTable!

    @IBOutlet var theModeLabel: WKInterfaceLabel!
    
    var currMode = "Roll"
         
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
    //Context menu actions
    func updateModeLabel()
    {
        self.theModeLabel.setText("Mode: \(self.currMode)")
    }
    
    @IBAction func rollContextButtonPressed()
    {
        self.currMode = "Roll"
        self.updateModeLabel()
    }
    @IBAction func editContextButtonPressed()
    {
        self.currMode = "Edit"
        self.updateModeLabel()
    }
    @IBAction func deleteContextButtonPressed()
    {
       self.currMode = "Delete"
        self.updateModeLabel()
    }
    
    func generateTable()
    {
        self.theTable.setNumberOfRows(DiceRollerMain.theRolls.count, withRowType: "cell")
        for( var i = 0; i < DiceRollerMain.theRolls.count; i++)
        {
            let currRow = self.theTable.rowControllerAtIndex(i) as! rollRow
            currRow.qtyLabel.setText("\(DiceRollerMain.theRolls[i].qty)")
            currRow.sidesLabel.setText("D"+"\(DiceRollerMain.theRolls[i].numSides)")
            currRow.nameLabel.setText("Name: \(DiceRollerMain.theRolls[i].name)")
        }

    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int)
    {
        if(currMode == "Roll")
        {
            self.presentAlertControllerWithTitle("The Roll", message: DiceRollerMain.theRolls[rowIndex].roll(), preferredStyle: WKAlertControllerStyle.Alert, actions: [rollAlert])
        }
        else if(currMode == "Edit")
        {
                        self.presentAlertControllerWithTitle("The Roll", message: "Edit", preferredStyle: WKAlertControllerStyle.Alert, actions: [rollAlert])
        }
        else if(currMode == "Delete")
        {
                        self.presentAlertControllerWithTitle("** Delete **", message: "Confirm Delete?", preferredStyle: WKAlertControllerStyle.Alert, actions: [deleteAlertConfrim, deleteAlertCancel])
        }
        
    }
    
    func updateUserDefults()
    {
        var theDiceStrings = [String]()
        for(var i = 0; i < DiceRollerMain.theRolls.count; i++)
        {
            theDiceStrings.append(DiceRollerMain.theRolls[i].toString())
            
        }
        
        let prefs = NSUserDefaults.standardUserDefaults()
        prefs.setObject(theDiceStrings, forKey: "theDiceStrings")
    }

   

    override func willActivate() {
        
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        if(DiceRollerMain.hasDice)
        {
            DiceRollerMain.theRolls.append(Roll(qty: DiceRollerMain.numDice, numSides: DiceRollerMain.numSides, name: DiceRollerMain.currName))
            DiceRollerMain.resetValues()
            
           //update user defluts
            self.updateUserDefults()
            
            
            
            self.generateTable()
            
            
            
            
        }
       
    
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
