//
//  ViewController.swift
//  NiceOneTask
//
//  Created by Chaudhry Umair on 30/12/2023.
//

import UIKit
import SnapKit
import Kingfisher

class ShoppingBasketVC: UIViewController {
    // MARK: Views

    lazy var navigationView = UIView(frame: .zero)
    lazy var imgUpload = UIImageView(frame: .zero)
    lazy var lblTitle = UILabel(frame: .zero)
    lazy var lblHeading = UILabel(frame: .zero)
    lazy var progressBar = UIProgressView(progressViewStyle: .bar)
    lazy var imgBannerTop = UIImageView(frame: .zero)
    lazy var tableItems = UITableView(frame: .zero)
    let sugggestionItems:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    lazy var imgBannerCenter = UIImageView(frame: .zero)
    lazy var lblSuggestion = UILabel(frame: .zero)
    lazy var contentview = UIView(frame: .zero)
    lazy var bottomView = UIView(frame: .zero)
    lazy var lblItemsbottomView = UILabel(frame: .zero)
    lazy var btnCheckout = UIButton()
    
    // MARK: variables
    let scrollView = UIScrollView()
    var productsResults: [RecommendedProductsProduct]?


    // MARK: Views Life Cycle

    override func viewDidLoad() {
      super.viewDidLoad()
        setupConstraints()
        collectionViewSetup()
        tableviewSetup()
        self.navigationController?.navigationBar.isHidden = true
        loadJsonFile()
        scrollView.frame = CGRect(x: scrollView.frame.origin.x, y: scrollView.frame.origin.y, width: scrollView.frame.size.width, height: 2000)

    }
   
    // MARK: Utility Functions
    func loadJsonFile() {
        readLocalFile(forName: "ShoppingBasketData")
        if let localData = self.readLocalFile(forName: "ShoppingBasketData") {
        self.parse(jsonData: localData)
        }
        }
   
    func tableviewSetup() {
        tableItems.delegate = self
        tableItems.dataSource = self
        tableItems.register(TableCell.self, forCellReuseIdentifier: "MyCell")
        tableItems.bounces = false
        self.tableItems.reloadData()
        }
    
    func collectionViewSetup(){
   
    let screenWidth = UIScreen.main.bounds.width
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    layout.itemSize = CGSize(width: screenWidth/3  - 10, height: 214)
    layout.minimumInteritemSpacing = 4
    layout.minimumLineSpacing = 4
    layout.headerReferenceSize = CGSize(width: 10, height: 0)
    sugggestionItems.collectionViewLayout = layout
    sugggestionItems.bounces = false
    sugggestionItems.dataSource = self
    sugggestionItems.delegate = self
    sugggestionItems.register(ProductCell.self, forCellWithReuseIdentifier: "productCell")
    sugggestionItems.reloadData()
    scrollView.bounces = false
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
        self.contentview.addSubview(sugggestionItems)
        self.bottomView.addSubview(lblItemsbottomView)
        self.bottomView.addSubview(btnCheckout)
        self.view.addSubview(bottomView)
    }
    
    func setupUI(){
        addViews()

        contentview.backgroundColor = .clear
        self.view.backgroundColor = UIColor.init(hexaRGBA: "#F6F6F6")
        self.bottomView.backgroundColor = UIColor.white
        navigationView.backgroundColor = .white
        imgUpload.image = UIImage(named: "imgUpload")
        imgBannerTop.image = UIImage(named: "imgBannerTop")
        imgBannerCenter.image = UIImage(named: "imgCenter")
        imgBannerTop.contentMode = .redraw
        imgBannerCenter.contentMode = .redraw
        lblTitle.text = "سلة التسوق"
        lblHeading.text = "هل ترغب بتوصيل مجانى ؟أضف 141.00 ريال إلى سلتك"
        lblSuggestion.text = "منتجات قد تنال اعجابك"
        lblItemsbottomView.text = "4 منتجات - SR 600"
        lblHeading.font = UIFont.systemFont(ofSize: 13)
        lblItemsbottomView.font = UIFont.systemFont(ofSize: 13)
        lblItemsbottomView.textColor = .black
        lblSuggestion.font = UIFont.systemFont(ofSize: 16)
        progressBar.setProgress(0.4, animated: true)
        progressBar.trackTintColor = UIColor.init(hexaRGBA: "#F6F6F6")
        progressBar.tintColor = UIColor.init(hexaRGBA: "#EE92FF")
        progressBar.layer.cornerRadius = 4.0
        progressBar.clipsToBounds = true
        sugggestionItems.backgroundColor = .clear
        btnCheckout.setTitle("اختر عنوان التوصيل", for: .normal)
        btnCheckout.setTitleColor(.white, for: .normal)
        btnCheckout.backgroundColor = .black
        btnCheckout.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        if let tabBarItems = tabBarController?.tabBar.items {
            let tabItem = tabBarItems[1]
            tabItem.badgeValue = "2"
                }
        UIView.appearance().semanticContentAttribute = .forceRightToLeft

    }

    func setupConstraints(){
                                    
        setupUI()
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view)
            make.top.equalToSuperview().offset(-20)
        }
        contentview.snp.makeConstraints { make in
            make.top.bottom.equalTo(self.scrollView)
            make.left.right.equalTo(self.scrollView)
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
            make.trailing.equalTo(contentview.snp.trailing).offset(-8)
            make.top.equalTo(navigationView.snp.bottom).offset(6)
            make.height.equalTo(60)
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
        sugggestionItems.snp.makeConstraints { make in
            make.leading.equalTo(imgBannerCenter.snp.leading)
            make.trailing.equalTo(imgBannerCenter.snp.trailing)
            make.top.equalTo(lblSuggestion.snp.bottom).offset(8)
            make.bottom.equalTo(contentview.snp.bottom).offset(8)
        }
        
        bottomView.snp.makeConstraints { make in
            make.height.equalTo(150)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        lblItemsbottomView.snp.makeConstraints { make in
            make.height.equalTo(15)
            make.centerX.equalTo(bottomView.snp.centerX)
            make.top.equalTo(bottomView.snp.top).offset(10)
        }
        btnCheckout.snp.makeConstraints { make in
            make.height.equalTo(35)
            make.top.equalTo(lblItemsbottomView.snp.top).offset(25)
            make.leading.equalTo(bottomView.snp.leading)
            make.trailing.equalTo(bottomView.snp.trailing)
        }
        
    }
    
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
            let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
            return jsonData
            }
        } catch {
            print(error)}
        return nil
    }
    private func parse(jsonData: Data) {
        do {
            let decodedData = try JSONDecoder().decode(ShoppingBasketModel.self,
                                                    from: jsonData)
            productsResults = decodedData.data?.recommendedProducts?.products
        } catch {
            print("decode error")
        }
    }
    }


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
//MARK: - CollecvtionView
extension ShoppingBasketVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return productsResults?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! ProductCell
        cell.imgConcession.image = UIImage(named: "imgConcession")
        let url = URL(string: productsResults?[indexPath.row].thumb ?? "")
        cell.imgMain.kf.setImage(with: url)
        cell.lblTitle.text = productsResults?[indexPath.row].name ?? ""
        cell.lblPrice.text = productsResults?[indexPath.row].priceFormated ?? ""

             return cell
         
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}
