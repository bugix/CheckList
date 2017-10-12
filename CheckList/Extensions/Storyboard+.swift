//
//  Storyboard+.swift
//  CheckList
//
//  Created by Martin Imobersteg on 12.10.17.
//  Copyright © 2017 Martin Imobersteg. All rights reserved.
//

import UIKit

extension UIStoryboard {
    func instantiateViewController<T>(ofType type: T.Type) -> T {
        return instantiateViewController(withIdentifier: String(describing: type)) as! T
    }
}
