//
//  ParentViewController.swift
//  Shaadi-Swift
//
//  Created by Bhooshan Patil on 12/02/21.
//

import UIKit
protocol  UserListAble{
    func reloadData() -> Void;
    func handleError(error:AppError) -> Void;
}

class ParentViewController: UIViewController , UserListAble{
    
    var viewModel = UserListViewModel.shared;
    var dataSource:UserListDataController<User>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.onSuccess = {
            self.setDataSourceAndReload();
        };
        self.viewModel.onFailure = { (error) in
            self.handleError(error: error);
        };
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        if self.viewModel.items.count != 0  {
            self.setDataSourceAndReload();
        }
    }
    
    //MARK: - Reload Data
    func reloadData() {}
    //MARK: - Handle Error
    func handleError(error: AppError) {}
    
    //MARK: - Alert
    func showAlertForError(error:AppError) -> Void {
        
        let alert = UIAlertController(title: "Shaadi.com", message: error.devMessage, preferredStyle: .alert);
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil);
        alert.addAction(action);
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil);
        }
    }
    private func setDataSourceAndReload() -> Void {
        self.dataSource = UserListDataController(items: self.viewModel.items, reuseId: UserTableViewCell.reuseId)
        self.reloadData();
    }
}

