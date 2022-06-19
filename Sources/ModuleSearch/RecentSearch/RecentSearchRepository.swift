//
//  RecentSearchRepository.swift
//  ModuleSearch
//

import Foundation

final class RecentSearchRepository: RecentSearchService {
    func getRecentSearchKeywords() -> [String] {
        return  [
            "Mock Search 1",
            "Mock Search 2",
            "Mock Search 3",
        ]
    }
}
