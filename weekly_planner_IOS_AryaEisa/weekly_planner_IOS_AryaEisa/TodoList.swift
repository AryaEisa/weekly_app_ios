//
//  TodoList.swift
//  weekly_planner_IOS_AryaEisa
//
//  Created by Arya Pour Eisa on 2024-01-19.
//

import Foundation
import SwiftUI

struct Todolist: Identifiable{
    let id = UUID().uuidString
    let title: String
    var isDone = false
    var days: Days
}
enum Days: String{
    case  mandag = "Måndag"
    case tisdag = "Tisdag"
    case onsdag = "Onsdag"
    case torsdag = "Torsdag"
    case fredag = "Fredag"
    case lordag = "Lördag"
    case sondag = "Söndag"
    
}
