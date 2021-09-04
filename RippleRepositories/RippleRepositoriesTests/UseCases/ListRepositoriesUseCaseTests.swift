//
//  ListRepositoriesUseCaseTests.swift
//  RippleRepositoriesTests
//
//  Created by Muhammad Ewaily on 04/09/2021.
//

import XCTest
import SwiftyJSON
@testable import RippleRepositories

class ListRepositoriesUseCaseTests: XCTestCase {

    var sut: ListRepositoriesUseCaseProtocol!
    
    override func setUpWithError() throws {
        sut = ListRepositoriesUseCaseMock()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testFetchRepositories() {
        let expected = SearchResponseDTO(json: JSON(DataMocks.searchResponse!)).repositories.compactMap({$0.toDomain()})
        var fetchedData: [Repository]?
        
        sut.fetchRepositories(query: "query") { result in
            switch result {
            case .success(let repositories):
            fetchedData = repositories
            case .failure(let error):
            print(error)
            }
        }
        XCTAssertEqual(fetchedData, expected)
    }
    
    func testCacheRepositories() {
        let expectation = expectation(description: "Repositories list cached")
        var cached = false
        let dataToBeCached = SearchResponseDTO(json: JSON(DataMocks.searchResponse!)).repositories.compactMap({$0.toDomain()})
        
        sut.cacheRepositories(repositories: dataToBeCached) {
            cached = true
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssert(cached)
    }
    
    func testFetchCachedRepositories() {
        let expectation = expectation(description: "Cached repositories list fetched")
        
        let expected = SearchResponseDTO(json: JSON(DataMocks.searchResponse!)).repositories.compactMap({$0.toDomain()})
        var cached: [Repository]?
        
        sut.fetchCachedRepositories { result in
            switch result {
            case .success(let reponse):
                cached = reponse
            case .failure:
                cached = nil
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(cached, expected)
    }
}
