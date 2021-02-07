//
//  CustomCell.swift
//  alamofireTutorial-iOS
//
//  Created by kimhyungyu on 2021/02/07.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    static let identifier: String = "CustomCell"
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
