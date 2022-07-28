//
//  UUTabBarController.swift
//  U18
//
//  Created by 优优 on 2022/7/27.
//

import UIKit

class UUTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /// 是否为不透明背景 default is true
        tabBar.isTranslucent = false

        let homePageVC = UUHomeViewController(titles: ["推荐",
                                                       "VIP",
                                                       "订阅",
                                                       "排行"],
                                              vcs: [UUBoutiqueListViewController(),
                                                    UUVIPListViewController(),
                                                    UUSubscibeListViewController(),
                                                    UURankListViewController()],
                                              pageStyle: .navigationBarSegment)
        addChildViewController(homePageVC,
                               title: "首页",
                               image: UIImage(named: "tab_home"),
                               selectedImage: UIImage(named: "tab_home_S"))

        /// 分类
        let classVC = UUCateListViewController()
        addChildViewController(classVC,
                               title: "分类",
                               image: UIImage(named: "tab_class"),
                               selectedImage: UIImage(named: "tab_class_S"))


        /// 书架
        let bookVC = UUBookViewController(titles: ["收藏",
                                                  "书单",
                                                  "下载"],
                                         vcs: [UUBookGradViewController(),
                                               UUBookListViewController(),
                                               UUBookDownloadListVC()],
                                         pageStyle: .navigationBarSegment)
        addChildViewController(bookVC,
                               title: "书架",
                               image: UIImage(named: "tab_book"),
                               selectedImage: UIImage(named: "tab_book_S"))


        /// 我的
        let mineVC = UUMineViewController()
        addChildViewController(mineVC,
                               title: "我的",
                               image: UIImage(named: "tab_mine"),
                               selectedImage: UIImage(named: "tab_mine_S"))
    }

    func addChildViewController(_ childController: UIViewController, title:String?, image:UIImage? ,selectedImage:UIImage?) {

        childController.title = title
        childController.tabBarItem = UITabBarItem(title: nil,
                                                  image: image?.withRenderingMode(.alwaysOriginal),
                                                  selectedImage: selectedImage?.withRenderingMode(.alwaysOriginal))

        if UIDevice.current.userInterfaceIdiom == .phone {
            childController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
        addChild(UUNavigationController(rootViewController: childController))
    }

}

extension UUTabBarController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        guard let select = selectedViewController else { return .lightContent }
        return select.preferredStatusBarStyle
    }
}
