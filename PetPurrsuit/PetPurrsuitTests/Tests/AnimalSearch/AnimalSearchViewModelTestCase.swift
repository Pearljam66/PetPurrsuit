//
//  AnimalSearchViewModelTestCase.swift
//  PetPurrsuitTests
//
//  Created by Sarah Clark on 3/8/24.
//

import Foundation
import XCTest
@testable import PetPurrsuit

final class AnimalSearchViewModelTestCase: XCTestCase {
    let testContext = PersistenceController.preview.container.viewContext
    var viewModel: AnimalSearchViewModel!

    override func setUp() {
        super.setUp()
        viewModel = AnimalSearchViewModel(
            animalSearcher: AnimalSearcherMock(),
            animalStore: AnimalStoreService(context: testContext))
    }

    func testShouldFilterIsFalseForEmptyFilters() {
        XCTAssertTrue(viewModel.searchText.isEmpty)
        XCTAssertEqual(viewModel.ageSelection, .none)
        XCTAssertEqual(viewModel.typeSelection, .none)
        XCTAssertFalse(viewModel.shouldFilter)
    }

    func testShouldFilterIsTrueForSearchText() {
        viewModel.searchText = "Kiki"
        XCTAssertFalse(viewModel.searchText.isEmpty)
        XCTAssertEqual(viewModel.ageSelection, .none)
        XCTAssertEqual(viewModel.typeSelection, .none)
        XCTAssertTrue(viewModel.shouldFilter)
    }

    func testShouldFilterIsTrueForAgeFilter() {
        viewModel.ageSelection = .baby
        XCTAssertTrue(viewModel.searchText.isEmpty)
        XCTAssertEqual(viewModel.ageSelection, .baby)
        XCTAssertEqual(viewModel.typeSelection, .none)
        XCTAssertTrue(viewModel.shouldFilter)
    }

    func testShouldFilterIsTrueForTypeFilter() {
        viewModel.typeSelection = .cat
        XCTAssertTrue(viewModel.searchText.isEmpty)
        XCTAssertEqual(viewModel.ageSelection, .none)
        XCTAssertEqual(viewModel.typeSelection, .cat)
        XCTAssertTrue(viewModel.shouldFilter)
    }

    func testClearFiltersSearchTextIsNotEmpty() {
        viewModel.typeSelection = .cat
        viewModel.ageSelection = .baby
        viewModel.searchText = "Kiki"

        viewModel.clearFilters()

        XCTAssertFalse(viewModel.searchText.isEmpty)
        XCTAssertEqual(viewModel.ageSelection, .none)
        XCTAssertEqual(viewModel.typeSelection, .none)
        XCTAssertTrue(viewModel.shouldFilter)
    }

    func testClearFiltersSearchTextIsEmpty() {
        viewModel.typeSelection = .cat
        viewModel.ageSelection = .baby

        viewModel.clearFilters()

        XCTAssertTrue(viewModel.searchText.isEmpty)
        XCTAssertEqual(viewModel.ageSelection, .none)
        XCTAssertEqual(viewModel.typeSelection, .none)
        XCTAssertFalse(viewModel.shouldFilter)
    }
}
