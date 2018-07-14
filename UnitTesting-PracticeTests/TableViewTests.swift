//
//  TableViewTests.swift
//  UnitTesting-PracticeTests
//
//  Created by malikj on 14/07/18.
//  Copyright © 2018 malikj. All rights reserved.
//

import XCTest
@testable import UnitTesting_Practice


class TableViewTests: XCTestCase {
    
    var sut: SelectionViewController!
    var mockDelegate: MockSelectionViewControllerDelegate!
    
    override func setUp() {
        super.setUp()
         mockDelegate =  MockSelectionViewControllerDelegate()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_tableViewDidSelectRowtAtIndexPath_calls_delegateWithSelectedItem() {
        // GIVEN
        let mockItems = ["a", "b", "c"]
        sut = SelectionViewController(items: mockItems, delegate: mockDelegate)
        
        // WHEN
        sut.tableView(UITableView(), didSelectRowAt: IndexPath(row: 1, section: 0))
        
        // THEN
        XCTAssertEqual(mockDelegate.capturedItem, "b")
    }
    
    
}

class MockSelectionViewControllerDelegate: SelectionViewControllerDelegate  {
    var capturedItem: String?
    func didSelect(_ selectionViewController: SelectionViewController, item: String) {
        capturedItem = item
    }
}
