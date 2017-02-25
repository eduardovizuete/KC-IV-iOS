//
//  UIViewController+Pop.swift
//  Everpobre
//
//  Created by Diego Freniche Brito on 23/2/17.
//  Copyright © 2017 freniche. All rights reserved.
//

import UIKit

extension UIViewController {
    public func popExtended(nav: UINavigationController?) {
        let _ = nav?.popViewController(animated: true)
    }

}


extension UIViewController: Popable {
    func popProtocolOriented(nav: UINavigationController?) {
        let _ = nav?.popViewController(animated: true)
    }
}
