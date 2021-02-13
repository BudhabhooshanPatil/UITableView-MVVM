//
//  UserListViewModel.swift
//  Shaadi-Swift
//
//  Created by Bhooshan Patil on 12/02/21.
//

import Foundation

class UserListViewModel {
    
    static let shared = UserListViewModel();
    var items:[User] = [];
    var onSuccess:(()->())?
    var onFailure: ((AppError) ->())?
    
    public func getUsers(){
        
        DataRequest().fetchData(for: .get_users, withMethod: .get, queryParams: nil, bodyparams: nil) { (response:Result<[User], AppError>) in
            switch response{
            case .success(let users):
                self.items = users;
                self.onSuccess?()
                break
            case .failure(let error):
                self.onFailure?(error);
                break
            }
        }
    }
}
