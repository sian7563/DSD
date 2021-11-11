//
//  tableViewController.swift
//  Dasida
//
//  Created by kimsian on 2021/09/30.
//

import UIKit

class TableViewController: UIViewController{
    
    
    private let arr = ["김시안", "김기영", "정대현"]

    @IBOutlet weak private var tableView: UITableView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            tableView.delegate = self
            tableView.dataSource = self
            
            let nibName = UINib(nibName: "TableViewCell", bundle: nil)

            tableView.register(nibName, forCellReuseIdentifier: "FirstCell")


            // Do any additional setup after loading the view.
        }
    
    
    @IBAction func movePostVC(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "post") else {return}
        
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    }

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell", for: indexPath) as! TableViewCell
        cell.listLabel?.text = arr[indexPath.row]
        return cell
    }
    
    
}
