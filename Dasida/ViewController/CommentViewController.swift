//
//  CommentViewController.swift
//  Dasida
//
//  Created by kimsian on 2021/11/17.
//

import UIKit
import Alamofire

class CommentViewController: UIViewController {
    
    @IBOutlet weak var diaryTitle: UILabel!
    @IBOutlet weak var postContent: UILabel!
    
    var postTitle = String()
    var content = String()
    var id = Int()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        diaryTitle.text! = postTitle
        postContent.text! = content
    }
    
    @IBAction func deleteBtn(_ sender: Any) {
        
        let alert = UIAlertController(title: "알림", message: "일기를 삭제하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler : { ACTION in
            self.delete(self.id)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alert.addAction(defaultAction)
        alert.addAction(cancelAction)

        
        present(alert, animated: false)
    }
    
    private func delete(_ id: Int) {
        HTTPClient().delete(url: CommunityAPI.delete(id).path(), params: nil, header: Header.token.header()).responseJSON(completionHandler: { res in
            switch res.response?.statusCode{
            case 200 :
                self.navigationController?.popViewController(animated: true)
            default :
                print(res.response?.statusCode)
            }
        })
    }
}
