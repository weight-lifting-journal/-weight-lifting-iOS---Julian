//
//  UIColor + CustomColor.swift
//  Weight Lift
//
//  Created by Julian A. Fordyce on 2/7/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat = 1) {
        self.init(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    
    
    static let someBlue = UIColor(22, 26, 36)
}
