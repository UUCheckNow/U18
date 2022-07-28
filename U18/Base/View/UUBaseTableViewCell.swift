//
//  UUBaseTableViewCell.swift
//  U18
//
//  Created by 优优 on 2022/7/28.
//

import UIKit
import Reusable

class UUBaseTableViewCell: UITableViewCell, Reusable {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        configUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    open func configUI() {}

}
