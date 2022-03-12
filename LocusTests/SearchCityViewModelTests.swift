//
//  SearchCityViewModelTests.swift
//  LocusTests
//
//  Created by Lakshmi H R on 12/03/22.
//

import XCTest

@testable import Locus
class SearchCityViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    func testAPICallValidity(){
        testValidCallToAPIsHTTPStatusCode200(forURLString: String.oneCallUrl + Constants.API_KEY + "&lat=" + String(33.44) + "&lon=" + String(-94.04))
    }
    
    func testValidCallToAPIsHTTPStatusCode200(forURLString : String) {
      // given
      let url = URL(string: forURLString)
      //set an expection with the help of promise to get status code = 200
      let promise = expectation(description: "Status code: 200")

        let dataTask = URLSession.shared.dataTask(with: url!) { data, response, error in
        // then
        if let error = error {
          XCTFail("Error: \(error.localizedDescription)")
          return
        }
        else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
          if statusCode == 200 {
            promise.fulfill()
            XCTAssertNil(error)
            XCTAssertEqual(statusCode, 200)
          } else {
            XCTFail("Status code: \(statusCode)")
          }
        }
      }
      dataTask.resume()
      wait(for: [promise], timeout: 5)
      
    }

}
