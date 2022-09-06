//
//  AddViewController.swift
//  ToDoApp
//
//  Created by 春田実利 on 2022/09/05.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController {
    
    @IBOutlet var todoTextField: UITextField!
    @IBOutlet var detailTextField: UITextField!
    @IBOutlet var dateTextField: UITextField!
    
    let realm = try! Realm()
    
    var datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let todo: ToDo? = read()
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        
        toolbar.setItems([spacelItem, doneItem], animated: true)
        
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        
        dateTextField.inputView = datePicker
        dateTextField.inputAccessoryView = toolbar
        
        // Do any additional setup after loading the view.
    }
    
    func read() -> ToDo? {
        return realm.objects(ToDo.self).first
        
    }
    
    @objc func done() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年 M月d日"
        dateTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @IBAction func save() {
        let todo: ToDo? = read()
        
        let title: String = todoTextField.text!
        let detail: String = detailTextField.text!
        let date: String = dateTextField.text!
        
        try! realm.write {
            todo!.title = title
            todo!.detail = detail
            todo!.date = date
            
        }
        
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
