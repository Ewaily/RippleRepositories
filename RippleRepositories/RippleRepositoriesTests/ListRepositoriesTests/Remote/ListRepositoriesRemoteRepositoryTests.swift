//
//  ListRepositoriesRemoteRepositoryTests.swift
//  RippleRepositoriesTests
//
//  Created by Muhammad Ewaily on 02/09/2021.
//

@testable import RippleRepositories
import XCTest
import SwiftyJSON

class ListRepositoriesRemoteRepositoryTests: XCTestCase {
    
    var sut: ListRepositoriesRepository!
    var queryKey: String!
    
    override func setUpWithError() throws {
        let apiRemote = RepositoriesAPI()
        sut = ListRepositoriesRepository(remote: apiRemote)
        queryKey = "ripple"
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }

    func testFetchListWithSuccess() {
        // GIVEN
        let expectation = expectation(description: "Repos List fetched")
        let expected = SearchResponseDTO(json: JSON(DataMocks.searchResponse!)).repositories.compactMap({$0.toDomain()})
        var searchResponse: [Repository]?
        // WHEN
        sut.fetchRepositories(query: queryKey) { result in
            switch result {
            case .success(let reponse):
                searchResponse = reponse
            case .failure:
                searchResponse = nil
            }
            expectation.fulfill()
        }
        // Then
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(searchResponse, expected)
    }
}
