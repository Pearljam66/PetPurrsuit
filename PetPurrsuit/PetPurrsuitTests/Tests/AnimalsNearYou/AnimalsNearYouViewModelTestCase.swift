//
//  AnimalsNearYouViewModelTestCase.swift
//  PetPurrsuitTests
//
//  Created by Sarah Clark on 3/7/24.
//

import XCTest
@testable import PetPurrsuit

@MainActor
final class AnimalsNearYouViewModelTestCase: XCTestCase {
    let testContext = PersistenceController.preview.container.viewContext
    var viewModel: AnimalsNearYouViewModel!

    @MainActor
    override func setUp() {
        super.setUp()
        viewModel = AnimalsNearYouViewModel(animalFetcher: AnimalsFetcherMock(), animalStore: AnimalStoreService(context: testContext))
    }

    func testFetchAnimalsLoadingState() async {
        XCTAssertTrue(viewModel.isLoading, "The view model SHOULD be loading, but it isn't.")
        await viewModel.fetchAnimals()
        XCTAssertFalse(viewModel.isLoading, "The view model SHOULD NOT be loading, but it is. ")
    }

    func testUpdatePageOnFetchMoreAnimals() async {
        XCTAssertEqual(viewModel.page, 1, "The view model's page property should be 1 before fetching but it's \(viewModel.page)")
        await viewModel.fetchMoreAnimals()
        XCTAssertEqual(viewModel.page, 2, "The view model's page property should be two after fetching but it's \(viewModel.page)")
    }

    func testFetchAnimalsEmptyResponse() async {
        viewModel = AnimalsNearYouViewModel(isLoading: true, animalFetcher: EmptyResponseAnimalsFetcherMock(), animalStore: AnimalStoreService(context: testContext))
        await viewModel.fetchAnimals()
        XCTAssertFalse(viewModel.hasMoreAnimals, "hasMoreAnimals should be false with an empty response, but it's true")
        XCTAssertFalse(viewModel.isLoading, "The view model shouldn't be loading after receiving an empty response, but it is.")
    }
}
