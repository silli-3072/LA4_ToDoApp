//
//  ViewController.swift
//  ToDoApp
//
//  Created by 春田実利 on 2022/09/05.
//

import UIKit
import RealmSwift


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var listView: UITableView!
    
    let realm = try! Realm()
    
    var cellNumber = 0
    
    var todoItem: Results<ToDo>!
    
    //    let ToDo = ["ベランダの天井を治す","管理会社とコンタクトをとる","引越したいから物件を探す","引越しにかかる費用を割り出す"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userData = realm.objects(ToDo.self)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let userData = realm.objects(ToDo.self)
        
        listView.reloadData()
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDisplay" {
            let nextView = segue.destination as! DetailViewController
      
            nextView.cellNum = cellNumber
        }
        
    }
    
    //セルの個数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let userData = realm.objects(ToDo.self)
        return userData.count
        
    }
    
    //セルの値を設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //cellの取得
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)
        
        let userData = realm.objects(ToDo.self)
        
        //表示する値の設定
        cell.textLabel!.text = "\(userData[indexPath.row].title)"
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let userData = realm.objects(ToDo.self)
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [self] (action, view, completionHandler) in
            
            let item = userData[indexPath.row]
            
            try! realm.write {
                self.realm.delete(item)
            }
            
            tableView.reloadData()
            
            completionHandler(true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        cellNumber = indexPath.row
        
        self.performSegue(withIdentifier: "toDetailViewController", sender: nil)
        
        print("🎀",cellNumber)
    }
    
}

