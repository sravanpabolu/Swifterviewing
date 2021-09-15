//
//  SwifterviewingTests.swift
//  SwifterviewingTests
//
//  Created by Tyler Thompson on 7/9/20.
//  Copyright © 2020 World Wide Technology Application Services. All rights reserved.
//

import XCTest
@testable import Swifterviewing

class SwifterviewingTests: XCTestCase {
    var viewModel: ViewModel?
    
    override func setUpWithError() throws {
        viewModel = ViewModel()
        setUpAlbums()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func setUpAlbums() {
        
        
        let album1 = Album(albumID: 1, id: 1, title: "ONE", url: "", thumbnailURL: "")
        let album2 = Album(albumID: 2, id: 2, title: "TWO", url: "https://via.placeholder.com/600/771796", thumbnailURL: "https://via.placeholder.com/600/771796")
        let album3 = Album(albumID: nil, id: nil, title: nil, url: nil, thumbnailURL: nil)
        viewModel?.albums.append(album1)
        viewModel?.albums.append(album2)
        viewModel?.albums.append(album3)
    }
}

extension SwifterviewingTests {
    func testRemovalOfLetterE() {
        let response = viewModel?.getFormattedString("Elephant")
        XCTAssertEqual("lphant", response)
    }
    
    func testAlbumTitle() {
        let response = viewModel?.getAlbumTitle(for: 0)
        XCTAssertEqual("ON", response)
    }
    
    func testAlbumTitleNIL() {
        let response = viewModel?.getAlbumTitle(for: 2)
        XCTAssertEqual("", response)
    }
    
    func testGetURL() {
        let response = viewModel?.getURL(for: 1)
        XCTAssertNotNil(response)
    }
    
    func testGetNILURL() {
        let response = viewModel?.getURL(for: 0)
        XCTAssertNil(response)
    }
    
    func testGetPhotos() {
        let url = viewModel?.urlString ?? ""
        let expect = expectation(description: "get album data")
        viewModel?.getAlbumData(url, completion: { (albumData, _) in
            expect.fulfill()
            XCTAssertNotNil(albumData)
        })
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testGetPhotosError() {
        let url = ""
        let expect = expectation(description: "get album data")
        viewModel?.getAlbumData(url, completion: { (_, error) in
            expect.fulfill()
            XCTAssertNotNil(error)
        })
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testRowHeight() {
        XCTAssertEqual(111, viewModel?.rowHeight)
    }
}
