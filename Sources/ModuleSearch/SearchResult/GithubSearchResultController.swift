//
//  GithubSearchResultController.swift
//  ModularSearch
//

import UIKit
import ModuleDesignSystem

protocol GithubSearchResultControllerDelegate: AnyObject {
    func selectedRecentSearch(keyword: String)
}

final class GithubSearchResultController: UIViewController {
    var statusTitle: String? {
        didSet {
            titleLabel.text = statusTitle
        }
    }

    var recentSearches: [String] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    weak var delegate: GithubSearchResultControllerDelegate?

    private lazy var titleLabel = DesignSystem.TitleLabel()
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.reuseIdentifier)
        return tableView
    }()

    override func viewDidLoad() {
        setupView()
    }

    private func setupView() {
        view.backgroundColor = UIColor.systemBackground
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension GithubSearchResultController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selectedRecentSearch(keyword: recentSearches[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension GithubSearchResultController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recentSearches.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.reuseIdentifier, for: indexPath)
        cell.textLabel?.text = recentSearches[indexPath.row]
        return cell
    }
}
