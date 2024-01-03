//
//  ViewController.swift
//  NiceOneTask
//
//  Created by Chaudhry Umair on 30/12/2023.
//

import UIKit
import SnapKit

class ShoppingBasketVC: UIViewController {
    // MARK: Views

    lazy var navigationView = UIView(frame: .zero)
    lazy var imgUpload = UIImageView(frame: .zero)
    lazy var lblTitle = UILabel(frame: .zero)
    lazy var lblHeading = UILabel(frame: .zero)
    lazy var progressBar = UIProgressView(progressViewStyle: .bar)
    lazy var imgBannerTop = UIImageView(frame: .zero)
    lazy var tableItems = UITableView(frame: .zero)
    lazy var imgBannerCenter = UIImageView(frame: .zero)
    lazy var lblSuggestion = UILabel(frame: .zero)


    lazy var contentview = UIView(frame: .zero)

    // MARK: variables
    let scrollView = UIScrollView()

    // MARK: Views Life Cycle

    override func viewDidLoad() {
      super.viewDidLoad()
    setupConstraints()
    self.navigationController?.navigationBar.isHidden = true
    }
   
    // MARK: Utility Functions
   
    func tableviewSetup() {
        tableItems.delegate = self
        tableItems.dataSource = self
        tableItems.register(TableCell.self, forCellReuseIdentifier: "MyCell")
        tableItems.bounces = false
        self.tableItems.reloadData()
        }
    
    func addViews(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentview)
        self.contentview.addSubview(navigationView)
        self.contentview.addSubview(imgUpload)
        self.contentview.addSubview(lblTitle)
        self.contentview.addSubview(lblHeading)
        self.contentview.addSubview(progressBar)
        self.contentview.addSubview(imgBannerTop)
        self.contentview.addSubview(tableItems)
        self.contentview.addSubview(imgBannerCenter)
        self.contentview.addSubview(lblSuggestion)

    }
    
    func setupUI(){
        addViews()
        contentview.backgroundColor = .clear
        self.view.backgroundColor = UIColor.init(hexaRGBA: "#F6F6F6")
        navigationView.backgroundColor = .white
        imgUpload.image = UIImage(named: "imgUpload")
        imgBannerTop.image = UIImage(named: "imgBannerTop")
        imgBannerCenter.image = UIImage(named: "imgCenter")
        imgBannerTop.contentMode = .redraw
        imgBannerCenter.contentMode = .redraw

             
        lblTitle.text = "سلة التسوق"
        lblHeading.text = "هل ترغب بتوصيل مجانى ؟أضف 141.00 ريال إلى سلتك"
        lblSuggestion.text = "منتجات قد تنال اعجابك"

        lblHeading.font = UIFont.systemFont(ofSize: 13)
        lblSuggestion.font = UIFont.systemFont(ofSize: 16)

        progressBar.setProgress(0.4, animated: true)
        progressBar.trackTintColor = UIColor.init(hexaRGBA: "#F6F6F6")
        progressBar.tintColor = UIColor.init(hexaRGBA: "#EE92FF")
        progressBar.layer.cornerRadius = 4.0
        progressBar.clipsToBounds = true
//        UIView.appearance().semanticContentAttribute = .forceRightToLeft

    }

    func setupConstraints(){
                                    // HeaderView
        setupUI()
        scrollView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        contentview.snp.makeConstraints { make in
            make.top.bottom.equalTo(self.scrollView)
            make.left.right.equalTo(self.view)
            make.width.equalTo(self.scrollView)
            make.height.equalTo(self.scrollView)
        }
        navigationView.snp.makeConstraints { make in
            make.leading.equalTo(contentview.snp.leading)
            make.trailing.equalTo(contentview.snp.trailing)
            make.top.equalTo(contentview.snp.top)
            make.height.equalTo(100)

        }
        imgUpload.snp.makeConstraints { make in
            make.leading.equalTo(navigationView.snp.leading).offset(17)
            make.bottom.equalTo(navigationView.snp.bottom).offset(-70)
            make.height.width.equalTo(17)
        }
        lblTitle.snp.makeConstraints { make in
            make.centerX.equalTo(navigationView.snp.centerX)
            make.centerY.equalTo(imgUpload.snp.centerY)
        }
                                      // Body
        lblHeading.snp.makeConstraints { make in
            make.leading.equalTo(contentview.snp.leading).offset(20)
            make.trailing.equalTo(contentview.snp.trailing).offset(-20)
            make.bottom.equalTo(navigationView.snp.bottom).offset(-20)
            make.height.equalTo(25)
        }
        
        progressBar.snp.makeConstraints { make in
            make.leading.equalTo(lblHeading.snp.leading)
            make.trailing.equalTo(navigationView.snp.trailing).offset(-30)
            make.top.equalTo(lblHeading.snp.bottom).offset(5)
            make.height.equalTo(8)
        }
        imgBannerTop.snp.makeConstraints { make in
            make.leading.equalTo(contentview.snp.leading).offset(10)
            make.trailing.equalTo(contentview.snp.trailing).offset(-10)
            make.top.equalTo(navigationView.snp.bottom).offset(8)
            make.height.equalTo(90)
        }
        tableItems.snp.makeConstraints { make in
            make.leading.equalTo(contentview.snp.leading)
            make.trailing.equalTo(contentview.snp.trailing)
            make.top.equalTo(imgBannerTop.snp.bottom).offset(8)
            make.height.equalTo(300)
        }
        imgBannerCenter.snp.makeConstraints { make in
            make.leading.equalTo(imgBannerTop.snp.leading)
            make.trailing.equalTo(imgBannerTop.snp.trailing)
            make.top.equalTo(tableItems.snp.bottom).offset(8)
            make.height.equalTo(143)
        }
        lblSuggestion.snp.makeConstraints { make in
            make.leading.equalTo(imgBannerCenter.snp.leading)
            make.top.equalTo(imgBannerCenter.snp.bottom).offset(8)
            make.height.equalTo(24)
        }
        tableviewSetup()
    }
}



//        if let tabBarItems = tabBarController?.tabBar.items {
//             let tabItem = tabBarItems[1]
//             tabItem.badgeValue = "5"
//        }



//MARK: - TableView

@available(iOS 13.0, *)
extension ShoppingBasketVC: UITableViewDelegate , UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! TableCell
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = bgColorView
        cell.imgItem.contentMode = .redraw
        cell.imgBin.contentMode = .scaleAspectFit

        if indexPath.row == 0 {
            cell.imgItem.image = UIImage(named: "img1")
            cell.imgBin.image = UIImage(named: "imgBin")
            cell.lblCategory.text = "ماركة هيمالايا"
            cell.lblTitle.text = "هيمالايا شامبو بيتش اللوز وحمص الصويا بروتين 400 مل"
            cell.lblprice.text = "600"
            cell.lblprice.textColor = .red

        }else if indexPath.row == 1 {
            cell.imgItem.image = UIImage(named: "img2")
            cell.imgBin.image = UIImage(named: "imgBin")
            cell.lblCategory.text = "شانيل"
            cell.lblTitle.text = "عطر نيرو اسولوتو من روبرتو كفالي للنساء - او دي بارفيوم"
            cell.lblprice.text = "600"


        }else if indexPath.row == 2 {
            cell.imgItem.image = UIImage(named: "img3")
            cell.imgBin.image = UIImage(named: "imgBin")
            cell.lblCategory.text = "لانكوم"
            cell.lblTitle.text = "مانيكور من لانكوم روبرتو كفالي للنساء - او دي بارفيوم"
            cell.lblprice.text = "600"
        }
        return cell
    }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100.0
    }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

    }
