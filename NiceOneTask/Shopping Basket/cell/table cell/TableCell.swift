//
//  tableCell.swift
//  NiceOneTask
//
//  Created by Chaudhry Umair on 03/01/2024.
//

import UIKit
import SnapKit

class TableCell: UITableViewCell {
    
    lazy var imgItem = UIImageView(frame: .zero)
    lazy var imgBin = UIImageView(frame: .zero)
    lazy var stepperView = UIView(frame: .zero)
    lazy var lblCategory = UILabel(frame: .zero)
    lazy var lblTitle = UILabel(frame: .zero)
    lazy var lblprice = UILabel(frame: .zero)
    let stackView = UIStackView()
    let btnPlus = UIButton()
    let btnMinus = UIButton()
    let lblVal = UILabel()
    
    var productCounter: Int = 0
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        constraintAdd()
        
        lblCategory.font = UIFont.systemFont(ofSize: 11)
        lblTitle.font = UIFont.systemFont(ofSize: 13)
        lblVal.font = UIFont.systemFont(ofSize: 12)
        stepperView.layer.borderColor = UIColor.lightGray.cgColor
        stepperView.layer.borderWidth = 1.0

        lblCategory.textColor =   UIColor.init(hexaRGB: "202020")
        lblTitle.textColor = .black
        lblTitle.numberOfLines = 2
        btnPlus.setTitle("+", for: .normal)
        btnPlus.setTitleColor(.darkGray, for: .normal)
        btnMinus.setTitleColor(.darkGray, for: .normal)

        btnMinus.setTitle("-", for: .normal)
        lblVal.text = "\(productCounter)"

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    @objc func buttonAction(sender: UIButton!) {
        productCounter = productCounter + 1
        print("\(productCounter)")
     }
    func addStackViewSetup() {
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        stackView.addArrangedSubview(btnPlus)
        stackView.addArrangedSubview(lblVal)
        stackView.addArrangedSubview(btnMinus)
    }
    func addSubviews() {
        addSubview(imgItem)
        addSubview(imgBin)
        addSubview(stepperView)
        addSubview(lblCategory)
        addSubview(lblTitle)
        addSubview(lblprice)
        addSubview(btnPlus)
        addSubview(lblVal)
        addSubview(btnMinus)
        addSubview(stackView)

        addStackViewSetup()



    }
    func constraintAdd() {
        imgItem.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(5)
            make.height.width.equalTo(100)
        }
        imgBin.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-15)
            make.top.equalToSuperview().offset(15)
            make.height.equalTo(18)
            make.width.equalTo(14)
        }
        lblCategory.snp.makeConstraints { make in
            make.leading.equalTo(imgItem.snp.trailing).offset(8)
            make.top.equalTo(imgItem.snp.top).offset(16)
            make.height.equalTo(15)
            make.width.equalTo(60)
        }
        lblTitle.snp.makeConstraints { make in
            make.leading.equalTo(lblCategory.snp.leading)
            make.top.equalTo(lblCategory.snp.bottom)
            make.height.equalTo(40)
            make.width.equalTo(230)
        }
        lblprice.snp.makeConstraints { make in
            make.leading.equalTo(lblTitle.snp.leading)
            make.top.equalTo(lblTitle.snp.bottom)
            make.height.equalTo(15)
            make.width.equalTo(50)
        }
        
        stepperView.snp.makeConstraints { make in
            make.trailing.equalTo(imgBin.snp.trailing)
            make.bottom.equalToSuperview().offset(-15)
            make.height.equalTo(20)
            make.width.equalTo(70)
        } 
        imgItem.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(5)
            make.height.width.equalTo(100)
        }
        imgBin.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-15)
            make.top.equalToSuperview().offset(15)
            make.height.equalTo(18)
            make.width.equalTo(14)
        }
        lblCategory.snp.makeConstraints { make in
            make.leading.equalTo(imgItem.snp.trailing).offset(8)
            make.top.equalTo(imgItem.snp.top).offset(16)
            make.height.equalTo(15)
            make.width.equalTo(60)
        }
        lblTitle.snp.makeConstraints { make in
            make.leading.equalTo(lblCategory.snp.leading)
            make.top.equalTo(lblCategory.snp.bottom)
            make.height.equalTo(40)
            make.width.equalTo(230)
        }
        lblprice.snp.makeConstraints { make in
            make.leading.equalTo(lblTitle.snp.leading)
            make.top.equalTo(lblTitle.snp.bottom)
            make.height.equalTo(15)
            make.width.equalTo(50)
        }
        stepperView.snp.makeConstraints { make in
            make.trailing.equalTo(imgBin.snp.trailing)
            make.bottom.equalToSuperview().offset(-15)
            make.height.equalTo(20)
            make.width.equalTo(70)
        }
        stackView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(stepperView)
        }
       
        
    }
    
}
