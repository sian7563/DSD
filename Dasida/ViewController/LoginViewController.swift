//
//  loginViewController.swift
//  Dasida
//
//  Created by kimsian on 2021/10/14.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak private var username: UITextField!
    @IBOutlet weak private var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction private func signin(_ sender: Any) {
        signIn(id: username.text!, password: password.text!)
    }
    
    @IBAction private func signup(_ sender: Any) {
        
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else {
            return
        }
        
        uvc.modalTransitionStyle = .coverVertical
             
        self.present(uvc, animated: true)
    }
    
    private func signIn(id: String, password: String) {
        HTTPClient().post(url: AuthAPI.signin.path(), params: ["id" : id, "password" : password], header: Header.tokenIsEmpty.header()).responseJSON(completionHandler: { res in
            switch res.response?.statusCode {
            case 201 :
                do {
                    print("okay")
                    let model = try JSONDecoder().decode(TokenModel.self, from: res.data!)
                    
                    Token.token = model.access_token
                    Token.refreshToken = model.refresh_token
                    
                    guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "community") else {return}
                    
                    self.navigationController?.pushViewController(vc, animated:  true)
                }
                catch {
                    print(error)
                }
                
            case 404:
                print("아이디나 비밀번호를 찾을 수 없습니다.")
            case 409:
                print("바디 요청이 잘못되었습니다.")
            default:
                print(res.response?.statusCode ?? 0)
            }})
    }
}
