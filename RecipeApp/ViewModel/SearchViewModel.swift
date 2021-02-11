//
//  SearchViewModel.swift
//  RecipeApp
//
//  Created by muhammed on 11/12/2020.
//  Copyright © 2020 S3soft. All rights reserved.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    
    @Published var searchText = ""
    @Published var isSearching = false {
        didSet {
            if isSearching == false {
                SearchDataManager.shared.resetToOriginal()
            } else {
                if searchText.count < searchMinimumCharacters {
                    SearchDataManager.shared.setEmpty()
                }
            }
        }
    }
    var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        // Use it for debouncing search text
        handleSearchText()
    }
}

extension SearchViewModel {
    
    func handleSearchText() {
        $searchText
            .debounce(for: .seconds(searchDebounceSecond), scheduler: RunLoop.main) // debounces the string publisher, such that it delays the process of sending request to API
            .removeDuplicates()
            .map({ (string) -> String? in
                if string.count < searchMinimumCharacters {
                    if self.isSearching {
                        SearchDataManager.shared.setEmpty()
                    }
                    
                    return nil
                }
                return string
            }) // prevents sending numerous requests and sends nil if the count of the characters is less than 1.
            .compactMap{ $0 } // removes the nil values so the search string does not get passed down to the publisher chain
            .sink { (_) in
                //
            } receiveValue: { searchField in
                SearchDataManager.shared.search(text: searchField)
            }
            .store(in: &cancellableSet)
    }
}


