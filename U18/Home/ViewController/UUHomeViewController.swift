//
//  UUHomeViewController.swift
//  U18
//
//  Created by 优优 on 2022/7/28.
//

import UIKit

class UUHomeViewController: UUPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func configNavigationBar() {
        super.configNavigationBar()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav_search"), style: .done, target: self, action: #selector(searchAction))
    }
    

    @objc func searchAction() {
        navigationController?.pushViewController(UUSearchViewController(), animated: true)
    }
}
