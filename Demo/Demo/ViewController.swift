//
//  ViewController.swift
//  Demo
//

import UIKit
import ModuleUI
import ModuleSearch

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!

    var searchController = ModuleSearch.UIFactory.searchController(
        designSystemFactory: ModuleUI.DesignSystemFactory()
    )

    override func viewDidLoad() {
        super.viewDidLoad()

        searchController.setup(navigationItem: navigationItem)
        searchController.onKeywordSearched = { [weak self] keyword in
            guard let self = self else { return  }
            self.searchController.searchStatusChanged(.searching)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.searchController.searchStatusChanged(.done)
                self.textView.text = "keyword: \(keyword)"
            }
        }
        searchController.defaultSearch()
    }
}

