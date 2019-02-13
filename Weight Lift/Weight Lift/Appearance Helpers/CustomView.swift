//
//  CustomView.swift
//  Weight Lift
//
//  Created by Julian A. Fordyce on 2/8/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    private func setUpView() {
        layer.cornerRadius = 30
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 10
        layer.shadowOpacity = 1
    }
    
    
}
