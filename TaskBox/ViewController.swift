//
//  ViewController.swift
//  TaskBox
//
//  Created by 猪飼　立晟 on 2018/10/22.
//  Copyright © 2018年 Tatsuika. All rights reserved.
//

import UIKit
let items = [
    "task1",
    "task2",
    "task3",
    "task4",
    "task5",
]
let reuseIdentifier = "reuseIdentifier"

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier : reuseIdentifier
        )
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
}

extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(
        title: nil, message: items[indexPath.row], preferredStyle: .alert
    )
    alertController.addAction(
        UIAlertAction(title: "OK", style: .default, handler: nil)
    )
        present(alertController, animated: true, completion: nil)
    }
}



