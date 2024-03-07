//
//  NetworkRequestManagerTests.swift
//  PetPurrsuitTests
//
//  Created by Sarah Clark on 2/10/24.
//

import XCTest
@testable import PetPurrsuit

class NetworkRequestManagerTests: XCTestCase {

    private var networkRequestManager: RequestManagerProtocol?

    override func setUp() {
        super.setUp()

        guard let userDefaults = UserDefaults(suiteName: #file) else { return }
        userDefaults.removePersistentDomain(forName: #file)
        networkRequestManager = RequestManager(
                                apiManager: PetFinderAPIManagerMock())
    }

    func testRequestAnimals() async throws {
        guard let container: AnimalsContainer = try await
                networkRequestManager?.perform(AnimalsRequestMock.getAnimals) else {
            XCTFail("No data returned from the NetworkRequestManager.")
            return
        }

        let animals = container.animals
        let firstAnimal = animals.first
        let lastAnimal = animals.last

        // First animal in AnimalMockData.
        XCTAssertEqual(firstAnimal?.name, "Kiki")
        XCTAssertEqual(firstAnimal?.age.rawValue, "Adult")
        XCTAssertEqual(firstAnimal?.gender.rawValue, "Female")
        XCTAssertEqual(firstAnimal?.size.rawValue, "Medium")
        XCTAssertEqual(firstAnimal?.coat?.rawValue, "Short")

        // Last animal in AnimalMockData.
        XCTAssertEqual(lastAnimal?.name, "Midnight")
        XCTAssertEqual(lastAnimal?.age.rawValue, "Adult")
        XCTAssertEqual(lastAnimal?.gender.rawValue, "Female")
        XCTAssertEqual(lastAnimal?.size.rawValue, "Large")
        XCTAssertEqual(lastAnimal?.coat, nil)

    }
}
