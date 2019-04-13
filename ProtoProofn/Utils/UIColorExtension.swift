//
//  UIColorExtension.swift
//  ProtoProofn
//
//  Created by Reza on 13/04/19.
//  Copyright © 2019 Kuwux. All rights reserved.
//

import UIKit

extension UIColor{
    static func generateRandomPastelColor() -> UIColor {
        // Randomly generate number in closure
        let randomColorGenerator = { ()-> CGFloat in
            CGFloat(arc4random() % 256 ) / 256
        }
        
        var red: CGFloat = randomColorGenerator()
        var green: CGFloat = randomColorGenerator()
        var blue: CGFloat = randomColorGenerator()
        
        var mixRed: CGFloat = 1+0xad/256, mixGreen: CGFloat = 1+0xd8/256, mixBlue: CGFloat = 1+0xe6/256;
        
        red = (red + mixRed) / 3;
        green = (green + mixGreen) / 3;
        blue = (blue + mixBlue) / 3;
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
}


