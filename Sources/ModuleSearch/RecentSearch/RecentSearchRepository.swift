//
//  RecentSearchRepository.swift
//  ModuleSearch
//

import Foundation

final class RecentSearchRepository: RecentSearchService {
    private let maxCount = 10

    @UserDefault(key: "recent_search_keywords", defaultValue: [])
    private var recentSearchKeywords: [String]

    func saveRecentSearchKeyword(_ keyword: String) {
        if let index = recentSearchKeywords.firstIndex(of: keyword) {
            recentSearchKeywords.remove(at: index)
        }
        recentSearchKeywords.insert(keyword, at: 0)
        if recentSearchKeywords.count > maxCount {
            recentSearchKeywords.removeLast()
        }
    }

    func getRecentSearchKeywords() -> [String] {
        return recentSearchKeywords
    }
}
