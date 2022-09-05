//
//  ToDo.swift
//  ToDoApp
//
//  Created by 春田実利 on 2022/09/05.
//

import Foundation
import RealmSwift

class ToDo: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var detail: String = ""
}
