//
//  Roll.swift
//  DiceRoller
//
//  Created by Alex Hinkle on 10/9/15.
//  Copyright © 2015 Alex Hinkle. All rights reserved.
//

import WatchKit

class Roll: NSObject
{
    var numSides: Int
    var qty: Int
    
    init(qty: Int, numSides: Int)
    {
        self.qty = qty
        self.numSides = numSides
    }
    
    init(rollString: String)
    {
        let parts = rollString.componentsSeparatedByString(":")
        self.qty = Int(parts[0])!
        self.numSides = Int(parts[1])!
    }
    
    func toString() -> String
    {
        return "\(qty):\(numSides)"
    }
    
}
