//
//  ViewController.swift
//  Shaadi-Swift
//
//  Created by Bhooshan Patil on 12/02/21.
//

import UIKit

class ViewController: ParentViewController {
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self;
        tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: UserTableViewCell.reuseId);
        self.viewModel.getUsers();
        
    }
    override func reloadData() {
        
        DispatchQueue.main.async {
            self.tableView.dataSource = self.dataSource;
            self.tableView.reloadData();
        }
    }
    override func handleError(error: AppError) {
        self.showAlertForError(error: error);
    }
}
extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "detailedViewController") as? DetailedViewController {
            controller.indexPath = indexPath;
            controller.viewModel = self.viewModel;
            self.navigationController?.pushViewController(controller, animated: true);
        }
    }
}
