//
//  CoreDataTests.swift
//  PetPurrsuitTests
//
//  Created by Sarah Clark on 3/5/24.
//

import CoreData
import XCTest
@testable import PetPurrsuit

final class CoreDataTests: XCTestCase {

    func testConvertToManagedCoreObject() throws {
        let previewContext = PersistenceController.preview.container.viewContext
        let fetchRequest = AnimalEntity.fetchRequest()
        fetchRequest.fetchLimit = 1
        fetchRequest.sortDescriptors = [NSSortDescriptor(keyPath: \AnimalEntity.name, ascending: true)]
        guard let results = try? previewContext.fetch(fetchRequest), let first = results.first else { return }

        XCTAssert(first.name == "CHARLA", """
        Pet name did not match, was expecting Kiki, got
        \(String(describing: first.name))
        """)

        XCTAssert(first.type == "Dog", """
        Pet type did not match, was expecting Cat, got
        \(String(describing: first.type))
        """)

        XCTAssert(first.coat.rawValue == "Short", """
        Pet coat did not match, was expecting Short, got
        \(String(describing: first.coat.rawValue))
        """)
    }

    func testDeleteManagedObjects() throws {
        let previewContext = PersistenceController.preview.container.viewContext
        let fetchRequest = AnimalEntity.fetchRequest()
        guard let results = try? previewContext.fetch(fetchRequest), let first = results.first else { return }

        let expectedResult = results.count - 1
        previewContext.delete(first)

        guard let resultsAfterDeletion = try? previewContext.fetch(fetchRequest) else { return }

        XCTAssertEqual(expectedResult, resultsAfterDeletion.count, """
        The number of results was expected to be \(expectedResult)
        after deletion, was \(results.count)
        """)
    }

    func testFetchRequestManagedObject() throws {
        let previewContext = PersistenceController.preview.container.viewContext
        let fetchRequest = AnimalEntity.fetchRequest()

        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: "name == %@", "Ellie")
        guard let results = try? previewContext.fetch(fetchRequest), let first = results.first else { return }

        XCTAssert(first.name == "Ellie", """
        Expecting Ellie got \(String(describing: first.name))
        """)
    }
}
