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
        let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNTQ0MzM1NjUxLCJleHAiOjE1NzU4OTMyNTF9.uqd2OHBYkGQpwjLTPPiPWYkYOKlG7whQDFkk46xGXoE"
        var request = URLRequest(url: baseURL)

        request.httpMethod = "POST"
        request.addValue(token, forHTTPHeaderField: "content-type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        

        let postString = ["email": email, "password": password] as! [String: String]

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: postString, options: .prettyPrinted)
        } catch {
            NSLog("error creating username and password: \(error)")
            return
        }
        let dataTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("error creating user data: \(error)")
                //completion(error)
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                if let parseJSON = json {
                    //                    let accessToken = parseJSON["token"] as? String
                    //                    let id = parseJSON["id"] as? String
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

