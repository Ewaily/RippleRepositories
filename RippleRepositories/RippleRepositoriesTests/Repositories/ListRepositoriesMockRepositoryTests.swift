//
//  ListRepositoriesMockRepositoryTests.swift
//  RippleRepositoriesTests
//
//  Created by Muhammad Ewaily on 01/09/2021.
//

@testable import RippleRepositories
import XCTest
import SwiftyJSON

class ListRepositoriesMockRepositoryTests: XCTestCase {
    
    var sut: ListRepositoriesRepository!
    
    override func setUpWithError() throws {
        let apiMock = RepositoriesAPIMock()
        sut = ListRepositoriesRepository(remote: apiMock)
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testFetchListWithSuccess() {
        // GIVEN
        let expected = SearchResponseDTO(json: JSON(DataMocks.searchResponse!)).repositories.compactMap({$0.toDomain()})
        var searchResponse: [Repository]?
        // WHEN
        sut.fetchRepositories(query: "ripple") { result in
            switch result {
            case .success(let reponse):
                searchResponse = reponse
            case .failure:
                searchResponse = nil
            }
        }
        // Then
        XCTAssertEqual(searchResponse, expected)
    }
    
    func testCacheRepositories() {
        let expectation = expectation(description: "Repositories list cached")
        let repositoriesToBeCached = SearchResponseDTO(json: JSON(DataMocks.searchResponse!)).repositories.compactMap({$0.toDomain()})
        var cached = false
        sut.cacheRepositories(repositories: repositoriesToBeCached) {
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
