//
//  CustomTextField.swift
//  Weight Lift
//
//  Created by Julian A. Fordyce on 2/7/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpField()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpField()
    }
    
    
    
    private func setUpField() {
        textColor = .darkGray
        autocorrectionType = .no
        layer.cornerRadius = 25.0
        clipsToBounds = true
        let indentView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        leftView = indentView
        leftViewMode = .always
    }
}
