//
//  DetailedViewController.swift
//  Shaadi-Swift
//
//  Created by Bhooshan Patil on 12/02/21.
//

import UIKit

class DetailedViewController: ParentViewController {
    
    @IBOutlet var userMeta: [UILabel]!
    @IBOutlet weak var btn: UIButton!
    var indexPath:IndexPath?
    
    var isCheck:Bool = false{
        didSet{
            let image =
                (isCheck) ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
            btn.setImage(image, for: .normal)
            if let index = indexPath?.row {
                self.viewModel.items[index].isStar = isCheck;
            }
        }
    }
    
    var user:User?{
        didSet{
            userMeta[0].text = user?.name
            userMeta[1].text = user?.username
            userMeta[2].text = user?.address?.city
            userMeta[3].text = user?.company?.name
            userMeta[4].text = user?.phone
            userMeta[5].text = user?.website
            self.isCheck = user!.isStar ?? false;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let index = indexPath?.row {
            self.user =  self.viewModel.items[index];
        }
    }
    
    @IBAction func didTapStarButton(_ sender: UIButton) {
        isCheck = !isCheck;
    }
    
}
