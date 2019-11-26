//
//  QiuBaiTableViewCell.swift
//  common
//
//  Created by 安静清晨 on 2019/11/12.
//  Copyright © 2019 walk-in-minds. All rights reserved.
//

import UIKit

class QiuBaiTableViewCell: UITableViewCell {
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var userId: UILabel!
    @IBOutlet weak var content: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
