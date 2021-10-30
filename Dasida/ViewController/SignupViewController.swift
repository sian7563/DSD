//
//  SignupViewController.swift
//  Dasida
//
//  Created by kimsian on 2021/10/26.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var username: UITextField!   // id
    @IBOutlet weak var password: UITextField!   // pw
    @IBOutlet weak var name: UITextField!  // name
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func SignupBtn(_ sender: Any) {
        
    }
    
    
    private func signUp(id: String, password: String) {
        HTTPClient().post(url: AuthAPI.signup.path(), params: ["name" : name, "id" : id, "password" : password], header: Header.tokenIsEmpty.header())
            .responseJSON(completionHandler: { res in
                switch res.response?.statusCode {
                case 201 :
                        print("name")
                        
                        guard let vc = self.storyboard? .instantiateViewController(withIdentifier: "signin") else {return}
                        
                        self.present(vc, animated: true, completion: nil)
                    
                default:
                    print(res.response?.statusCode ?? 0)
                }
            })
    }
    

}
