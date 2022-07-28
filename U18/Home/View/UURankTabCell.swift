//
//  UURankTabCell.swift
//  U18
//
//  Created by 优优 on 2022/7/28.
//

import UIKit

class UURankTabCell: UUBaseTableViewCell {

    var model: RankingModel? {
        didSet {
            guard let model = model else { return }
            iconView.kf.setImage(urlString: model.cover)
            titleLabel.text = "\(model.title ?? "")榜"
            descLabel.text = model.subTitle
        }
    }

    lazy var iconView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()

    lazy var descLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    override func configUI() {

        contentView.addSubview(iconView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descLabel)

        iconView.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.width.equalToSuperview().multipliedBy(0.5)
        }

        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(iconView.snp.right).offset(10)
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(iconView)
            make.height.equalTo(30)
        }

        descLabel.snp.makeConstraints { make in
            make.left.right.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.bottom.lessThanOrEqualTo(iconView)
        }
    }

}
