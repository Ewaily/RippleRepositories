//
//  ListRepositoriesViewModelTests.swift
//  RippleRepositoriesTests
//
//  Created by Muhammad Ewaily on 04/09/2021.
//

import XCTest
import SwiftyJSON
@testable import RippleRepositories

class ListRepositoriesViewModelTests: XCTestCase {

    var sut: ListRepositoriesViewModelProtocol!
    
    override func setUpWithError() throws {
       sut = ListRepositoriesViewModelMock()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testFetchLiveRepositories() {
        let expected = SearchResponseDTO(json: JSON(DataMocks.searchResponse!)).repositories.compactMap({$0.toDomain()})
        
        sut.fetchLiveRepositories {
            
        }
        XCTAssertEqual(sut.getRepositoryInfo(at: 0), expected[0])

    }

}
