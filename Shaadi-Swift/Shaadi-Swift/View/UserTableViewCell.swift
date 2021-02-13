//
//  UserTableViewCell.swift
//  Shaadi-Swift
//
//  Created by Bhooshan Patil on 12/02/21.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet var userMeta: [UILabel]!
    @IBOutlet weak var startBtn: UIButton!
    
    // MARK: - Variables
    class var reuseId: String {
        return "reuseIdentifier"
    }
    
    func bind(forUser user:User?) {
        userMeta[0].text = user?.name
        userMeta[1].text = user?.phone
        userMeta[2].text = user?.website
        userMeta[3].text = user?.company?.name
        let image =
            (user!.isStar ?? false) ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        startBtn.setImage(image, for: .normal)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
