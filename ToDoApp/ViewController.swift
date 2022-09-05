//
//  ViewController.swift
//  ToDoApp
//
//  Created by 春田実利 on 2022/09/05.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var listView: UITableView!
    
    let ToDo = ["ベランダの天井を治す","管理会社とコンタクトをとる","引越したいから物件を探す","引越しにかかる費用を割り出す"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //セルの個数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ToDo.count
        
    }
    
    //セルの値を設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //cellの取得
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)
        //表示する値の設定
        cell.textLabel!.text = ToDo[indexPath.row]
        return cell
    }
    
    
}

