//
//  DetailViewController.swift
//  ToDoApp
//
//  Created by 春田実利 on 2022/09/08.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController {
    
    let realm = try! Realm()
    
    var cellNum = 0
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userData = realm.objects(ToDo.self)
        
        titleLabel.text = "\(userData[cellNum].title)"
        detailLabel.text = "\(userData[cellNum].detail)"
        dateLabel.text = "\(userData[cellNum].date)"
        
        print("🧸",cellNum)
        print("🪩",userData)
        
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
