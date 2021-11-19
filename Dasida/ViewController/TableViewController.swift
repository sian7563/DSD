//
//  tableViewController.swift
//  Dasida
//
//  Created by kimsian on 2021/09/30.
//

import UIKit

class TableViewController: UIViewController{
    
    
    private var communityModel = CommmunityList()
    private var posts = [CommunityModel]()

    @IBOutlet weak private var tableView: UITableView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            let nibName = UINib(nibName: "TableViewCell", bundle: nil)

            tableView.register(nibName, forCellReuseIdentifier: "FirstCell")


            // Do any additional setup after loading the view.
        }

    @IBAction func movePostVC(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "post") else {return}
        
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.getList()
    }
    
    
    private func getList() {
        HTTPClient().get(url: CommunityAPI.watch.path(), params: nil,
                         header: Header.token.header()).responseJSON { [unowned self] res in
            switch res.response?.statusCode {
            case 200 :
                do {
                let model = try JSONDecoder().decode(CommmunityList.self, from: res.data!)
                communityModel.posts.removeAll()
                communityModel.posts.append(contentsOf: model.posts)
                tableView.reloadData()
                }
                catch {
                    print(error)
                }
            case 401 :
                print("토큰 오류.")
            case 404 :
                print("글을 찾지 못함.")
            default :
                print(res.response?.statusCode ?? 0)
            }
        }
    }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return communityModel.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell", for: indexPath) as! TableViewCell
        cell.listLabel?.text = communityModel.posts[indexPath.row].title
        communityModel.posts[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let commentVC = storyboard?.instantiateViewController(withIdentifier: "CommentVC") as? CommentViewController else {return}
        
        commentVC.postTitle = communityModel.posts[indexPath.row].title
        commentVC.content = communityModel.posts[indexPath.row].content
        commentVC.id = communityModel.posts[indexPath.row].id_pk
        
        navigationController?.pushViewController(commentVC, animated: true)
    }
    
}
