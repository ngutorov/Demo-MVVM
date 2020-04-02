//
//  Demo_MVVMTests.swift
//  Demo-MVVMTests
//
//  Created by Nikolay Gutorov on 3/31/20.
//  Copyright © 2020 Nikolay Gutorov. All rights reserved.
//

import XCTest
@testable import Demo_MVVM

class Demo_MVVMTests: XCTestCase {
    
    var topMoviesViewControllerUnderTest: TopMoviesViewController!
    
    override func setUpWithError() throws {
        super.setUp()
        
        topMoviesViewControllerUnderTest = TopMoviesViewController()
    }
    
    override func tearDownWithError() throws {
        
        topMoviesViewControllerUnderTest = nil
        
        super.tearDown()
    }
    
    func testTopMoviesListFetched() {
        
        // Given
        XCTAssertNil(topMoviesViewControllerUnderTest.viewModel.movies?.count)
        
        // When
        topMoviesViewControllerUnderTest.viewDidLoad()
        
        // Then
        XCTAssertNotNil(topMoviesViewControllerUnderTest.viewModel.movies?.count)
        XCTAssertEqual(topMoviesViewControllerUnderTest.tableView.numberOfRows(inSection: 0), topMoviesViewControllerUnderTest.viewModel.movies?.count)
    }
}
