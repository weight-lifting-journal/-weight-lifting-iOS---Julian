//
//  CustomButton.swift
//  Weight Lift
//
//  Created by Julian A. Fordyce on 2/7/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import  UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton() {
        backgroundColor = .black
        titleLabel?.font = UIFont(name: "San Franciso" , size: 20)
        layer.cornerRadius = frame.size.height / 2
        setTitleColor(.white, for: .normal)
        
    }
}
