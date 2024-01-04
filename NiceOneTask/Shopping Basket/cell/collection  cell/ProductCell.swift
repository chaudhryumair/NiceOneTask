//
//  ProductionCell.swift
//  NiceOneTask
//
//  Created by Chaudhry Umair on 03/01/2024.
//

import UIKit

class ProductCell: UICollectionViewCell {
    lazy var imgConcession = UIImageView(frame: .zero)
    lazy var lblConcession = UILabel(frame: .zero)
    lazy var imgMain = UIImageView(frame: .zero)
    lazy var lblTitle = UILabel(frame: .zero)
    lazy var lblPrice = UILabel(frame: .zero)
    lazy var imgAdd = UIImageView(frame: .zero)
    lazy var lblAddtoBag = UILabel(frame: .zero)


    override init(frame: CGRect) {
        super.init(frame: frame)
        lblConcession.textColor = .white
        lblPrice.textColor = .black

        contentView.backgroundColor = .white
        lblConcession.text = "-29%"
        lblTitle.text = "خافي عيوب كونسيلر كريمي من نارس"
        lblPrice.text = "SAR 190.0"
        lblAddtoBag.text = "أضف للسلة"
        lblAddtoBag.font = UIFont.systemFont(ofSize: 12)
        lblAddtoBag.textColor = UIColor.init(hexaRGBA: "#997ADB;")
        lblConcession.font = UIFont.systemFont(ofSize: 13)
        lblTitle.font = UIFont.systemFont(ofSize: 12)
        lblPrice.font = UIFont.systemFont(ofSize: 12)
        imgAdd.image = UIImage(named: "imgCellPlus")
        imgMain.contentMode = .scaleAspectFill
        imgAdd.contentMode = .scaleAspectFit
        lblTitle.numberOfLines = 2
        addViews()
    }

    required init?(coder aDecoder: NSCoder) { 
        fatalError("init(coder:) has not been implemented")
    }
    func addViews() {
        addSubview(imgConcession)
        addSubview(lblConcession)
        addSubview(imgMain)
        addSubview(lblTitle)
        addSubview(lblPrice)
        addSubview(imgAdd)
        addSubview(lblAddtoBag)

        constraintAdd()
    }
    
    func constraintAdd() {
       
        imgConcession.snp.makeConstraints { make in
            make.trailing.equalTo(contentView.snp.trailing).offset(0)
            make.top.equalTo(contentView.snp.top)
        }
        lblConcession.snp.makeConstraints { make in
            make.trailing.equalTo(imgConcession.snp.trailing)
            make.leading.equalTo(imgConcession.snp.leading).offset(8)
            make.top.equalTo(imgConcession.snp.top).offset(1)
            make.bottom.equalTo(imgConcession.snp.bottom)
        }
        imgMain.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(contentView.snp.top).offset(20)
            make.width.equalTo(89)
            make.height.equalTo(89)

        }
        lblTitle.snp.makeConstraints { make in
            make.top.equalTo(imgMain.snp.bottom).offset(0)
            make.leading.equalTo(contentView.snp.leading).offset(5)
            make.trailing.equalTo(contentView.snp.trailing).offset(-10)
            make.height.equalTo(36)

        }
        lblPrice.snp.makeConstraints { make in
            make.top.equalTo(lblTitle.snp.bottom).offset(2)
            make.leading.equalTo(contentView.snp.leading).offset(5)
            make.height.equalTo(18)
        }
        imgAdd.snp.makeConstraints { make in
            make.top.equalTo(lblPrice.snp.bottom).offset(15)
            make.trailing.equalToSuperview().offset(-25)
            make.height.equalTo(10)
            make.width.equalTo(10)

        }
        lblAddtoBag.snp.makeConstraints { make in
            make.top.equalTo(lblPrice.snp.bottom).offset(12)
            make.trailing.equalTo(imgAdd).offset(-20)
            make.height.equalTo(18)
            make.width.equalTo(62)

        }
    }
}
