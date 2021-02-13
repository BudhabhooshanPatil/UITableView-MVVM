//
//  UserListDataController.swift
//  Shaadi-Swift
//
//  Created by Bhooshan Patil on 12/02/21.
//

import UIKit

class UserListDataController<T>: NSObject ,UITableViewDataSource {
    
    var items:[T]
    var reuseId:String = ""
    
    init(items:[T] ,reuseId:String) {
        self.items = items;
        self.reuseId = reuseId;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseId, for: indexPath) as? UserTableViewCell{
            cell.bind(forUser: items[indexPath.row] as? User);
            return cell
        };
        return UITableViewCell()
    }
}
