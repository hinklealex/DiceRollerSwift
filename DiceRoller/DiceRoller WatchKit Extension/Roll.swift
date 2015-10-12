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
}
