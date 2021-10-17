//
//  tableViewController.swift
//  Dasida
//
//  Created by kimsian on 2021/09/30.
//

import UIKit

class tableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let arr = ["김시안", "김기영", "정대현"]

    @IBOutlet weak private var tableView: UITableView!
    @IBOutlet weak private var tableViewCell : UITableViewCell!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? UITableViewCell
    }

        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.delegate = self
            tableView.dataSource = self
            // Do any additional setup after loading the view.
        }


        /*
         // MARK: - Navigation

         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */

    }
