//
//  Global.swift
//  U18
//
//  Created by 优优 on 2022/7/28.
//

import Foundation
import UIKit
import Kingfisher
import SnapKit
import MJRefresh

let UUScreenWidth = UIScreen.main.bounds.width
let UUScreenHeight = UIScreen.main.bounds.height

var topVC: UIViewController? {
    var resultVC: UIViewController?
    if let window = UIApplication.shared.delegate?.window {
        resultVC = _topVC(window?.rootViewController)
    }
    while resultVC?.presentedViewController != nil {
        resultVC = _topVC(resultVC?.presentedViewController)
    }
    return resultVC
}

private func _topVC(_ vc: UIViewController?) -> UIViewController? {
    if vc is UINavigationController {
        return _topVC(vc as? UINavigationController)?.navigationController?.topViewController
    } else if vc is UITableViewController {
        return _topVC(vc as? UITableViewController)?.tabBarController?.selectedViewController
    } else {
        return vc
    }
}

//MARK: SnapKit

extension ConstraintView {
    var usnp: ConstraintBasicAttributesDSL {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.snp
        } else {
            return self.snp
        }
    }
}

//MARK: Kingfisher
extension Kingfisher where Base: ImageView {
    @discardableResult
    public func setImage(urlString: String?, placeholder: Placeholder? = UIImage(named: "normal_placeholder_h")) -> RetrieveImageTask {
        return setImage(with: URL(string: urlString ?? ""),
                        placeholder: placeholder,
                        options:[.transition(.fade(0.5))])
    }
}
