//
//  LoginViewController.swift
//  Weight Lift
//
//  Created by Julian A. Fordyce on 2/4/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        styleButton()
        styleTextField()
        
    }
    
    func styleButton() {
        loginButton.layer.cornerRadius = 25
        loginButton.backgroundColor = .blue
        loginButton.setTitleColor(.white, for: .normal)
        
    }

    func styleTextField() {
        emailTextField.layer.cornerRadius = 20
        passwordTextField.layer.cornerRadius = 20
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
 
    // MARK: - Properties
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
}
