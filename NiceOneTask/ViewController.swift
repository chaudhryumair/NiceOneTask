//
//  ViewController.swift
//  NiceOneTask
//
//  Created by Chaudhry Umair on 30/12/2023.
//

import UIKit

class ViewController: UIViewController {

  
    override func viewDidLoad() {
      super.viewDidLoad()
      setupUI()
        if let tabBarItems = tabBarController?.tabBar.items {
             let tabItem = tabBarItems[1]
             tabItem.badgeValue = "5"
        }
    }

    func setupUI(){
      view.backgroundColor = .white

      let homeLabel: UILabel = {
        let label = UILabel()
        label.text = "This is home screen"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
      }()

      view.addSubview(homeLabel)

     
      NSLayoutConstraint.activate([
       
        homeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        homeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
      ])

    }

   
}

