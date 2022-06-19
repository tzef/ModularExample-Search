//
//  ViewController.swift
//  Demo
//

import UIKit
import ModuleUI
import ModuleSearch

class ViewController: UIViewController {
    let searchController = ModuleSearch.UIFactory.searchController(
        designSystemFactory: ModuleUI.DesignSystemFactory()
    )

    override func viewDidLoad() {
        super.viewDidLoad()

        searchController.setup(navigationItem: navigationItem)
    }
}

