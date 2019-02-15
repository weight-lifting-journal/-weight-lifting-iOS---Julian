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
    }
    

    @IBAction func loginButtonTapped(_ sender: Any) {
        let email = emailTextField.text
        let password = passwordTextField.text

        if (email?.isEmpty)! || (password?.isEmpty)! {
            return
        }

        let baseURL = URL(string: "https://weightliftingjournallambda.herokuapp.com/users/login")!
        let authToken = SignupViewController.token
        var request = URLRequest(url: baseURL)

        request.httpMethod = "POST"
        request.addValue(authToken, forHTTPHeaderField: "Authorization")
        

        let postString = ["email": email, "password": password] as! [String: String]

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: postString, options: .prettyPrinted)
        } catch {
            NSLog("error creating username and password: \(error)")
            return
        }
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                NSLog("error creating user data: \(error)")
                //completion(error)
                return
            }
            if response != nil {
                print(response!)
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                if let parseJSON = json {
                    _ = parseJSON["token"] as? String
                    _ = parseJSON["id"] as? String
                }
            } catch {
                print(error)
            }
            
        }
        dataTask.resume()
        
    }
    
   
    
  // MARK: - Properties
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var loginButton: CustomButton!
    @IBOutlet weak var signupButton: UIButton!
    

}

