//
//  HttpClientTests.swift
//  UnitTesting-PracticeTests
//
//  Created by malikj on 14/07/18.
//  Copyright © 2018 malikj. All rights reserved.
//

import XCTest

@testable import UnitTesting_Practice

class HttpClientTests: XCTestCase {
    
    var mockURLSession: MockURLSession!
    
    var sut: HTTPClient!
    
    override func setUp() {
        super.setUp()
        mockURLSession = MockURLSession()
        sut = HTTPClient(session: mockURLSession)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_fetchData_calls_completionWithSuccessResult_whenDataIsReturnedFromSession() {
        // GIVEN
        let mockURL = URL(string: "www.test.com")!
        let expectation = self.expectation(description: #function)
        sut.fetchData(forURL: mockURL) { result in
            // THEN (Partly defined before WHEN because of asynchronous nature of test)
            switch result {
            case .success(let data):
                XCTAssertEqual(data, Data())
            case .failure(let error):
                XCTFail("Unexpected failure with error: \(error)")
            }
            expectation.fulfill()
        }
        
        // WHEN
        mockURLSession.capturedCompletion?(Data(), nil, nil)
        
        // THEN (continued)
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    
}

class MockURLSessionDataTask: URLSessionDataTask {
    override func resume() {}
}

class MockURLSession: URLSessionType {
    var capturedCompletion: ((Data?, URLResponse?, Error?) -> Void)?
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        capturedCompletion = completionHandler
        return MockURLSessionDataTask()
    }
}

