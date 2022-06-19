//
//  RecentSearchService.swift
//  ModuleSearch
//

protocol RecentSearchService {
    func getRecentSearchKeywords() -> [String]
    func saveRecentSearchKeyword(_ keyword: String)
}
