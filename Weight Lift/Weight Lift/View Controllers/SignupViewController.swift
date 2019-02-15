//
//  SignupViewController.swift
//  Weight Lift
//
//  Created by Julian A. Fordyce on 2/4/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    static let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNTQ0MzM1NjUxLCJleHAiOjE1NzU4OTMyNTF9.uqd2OHBYkGQpwjLTPPiPWYkYOKlG7whQDFkk46xGXoE"

    @IBAction func signupButtonTapped(_ sender: Any) {
    
    print("Signup button tapped")

        if (emailTextField.text?.isEmpty)! || (usernameTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)! {
            return
        }

        let url = URL(string: "https://weightliftingjournallambda.herokuapp.com/users/register")!
        let authToken = SignupViewController.token
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.addValue(authToken, forHTTPHeaderField: "Authorization")
        let postString = ["email": emailTextField.text, "username": usernameTextField.text, "password": passwordTextField.text] as! [String: String]

        do {
            request.httpBody = try
            JSONSerialization.data(withJSONObject: postString, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
            return
        }

        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in

            if error != nil {
                print("error: \(String(describing: error))")
                return
            }

            if response != nil {
                print(response!)
                return
            }

                    do {
            let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary

            if let parseJSON = json {

                let userID = parseJSON["userID"] as? String
                print("User id: \(String(describing: userID!))")
            } else {
        }
        } catch {
            print(error)
            }
        }
            
        task.resume()
    }
  

    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    

    
    // MARK: - Properties
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var usernameTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var signupButton: CustomButton!
    @IBOutlet weak var cancelButton: CustomButton!
}

