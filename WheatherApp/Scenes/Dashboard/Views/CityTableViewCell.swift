//
//  CityTableViewCell.swift
//  WheatherApp
//
//  Created by Mahendra Vishwakarma on 19/12/21.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.textLabel?.textColor = .white
        let bgColorView = UIView()
        bgColorView.layer.cornerRadius = 22
        bgColorView.layer.masksToBounds = true
        bgColorView.backgroundColor = UIColor.orange
        self.selectedBackgroundView = bgColorView
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static let identifier = String(describing: CityTableViewCell.self)
}
