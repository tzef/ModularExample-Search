//
//  UITableView+ReuseIdentifier.swift
//  ModuleSearch
//

import UIKit

public extension UITableViewCell {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}


