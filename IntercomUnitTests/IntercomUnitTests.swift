//
//  IntercomUnitTests.swift
//  IntercomUnitTests
//
//  Created by Daniel Farrell on 07/02/2020.
//  Copyright © 2020 Daniel Farrell. All rights reserved.
//

import XCTest

class IntercomUnitTests: XCTestCase {

    
    var customerLine = String()
    var customerLineNullLatValue = String()
    var customerLineNullIDValue = String()
    var customerLineNullNameValue = String()
    var customerLineNullLongValue = String()
    
    override func setUp() {
        customerLine = "{\"latitude\": \"52.986375\", \"user_id\": 12, \"name\": \"Christina McArdle\", \"longitude\": \"-6.043701\"}"
        customerLineNullLatValue = "{\"latitude\": , \"user_id\": 12, \"name\": \"Christina McArdle\", \"longitude\": \"-6.043701\"}"
        customerLineNullIDValue = "{\"latitude\": \"52.986375\", \"user_id\": , \"name\": \"Christina McArdle\", \"longitude\": \"-6.043701\"}"
        customerLineNullNameValue = "{\"latitude\": \"52.986375\", \"user_id\": 12, \"name\": , \"longitude\": \"-6.043701\"}"
        customerLineNullLongValue = "{\"latitude\": \"52.986375\", \"user_id\": 12, \"name\": \"Christina McArdle\", \"longitude\": }"
    }

    override func tearDown() {
        customerLine = ""
        customerLineNullLatValue = ""
        customerLineNullIDValue = ""
        customerLineNullNameValue = ""
        customerLineNullLongValue = ""
    }
    
    
    /*
     * Tests Converting Degrees to Radians
     * Method Under Test: DegreesConverterSupport.convertDegreesToRadians()
     * Assert - true
     */
    func testDegreesConverterSuccess() {
        
        var didConvertCorrectly = Bool()
        
        var radian = Double()
        let sampleDegree = 53.339428
        let correctRadianValue = 0.9304766884444444
        
        let degreesConverter = DegreesConverterSupport()
        radian = degreesConverter.convertDegreesToRadians(degree: sampleDegree)
        
        if (radian.isEqual(to: correctRadianValue)) {
            didConvertCorrectly = true
        } else {
            didConvertCorrectly = false
        }
        assert(didConvertCorrectly)
    }
    
    
    /*
     * Tests Converting Degrees to Radians
     * Method Under Test: DegreesConverterSupport.convertDegreesToRadians()
     * Assert - false
     */
    func testDegreesConverterFailure() {
        
        var didConvertCorrectly = Bool()
        
        var radian = Double()
        let sampleDegree = 53.339428
        let incorrectRadianValue = 1.930484444444
        
        let degreesConverter = DegreesConverterSupport()
        radian = degreesConverter.convertDegreesToRadians(degree: sampleDegree)
        
        if (radian.isEqual(to: incorrectRadianValue)) {
            didConvertCorrectly = true
        } else {
            didConvertCorrectly = false
        }
        assert(!didConvertCorrectly)
    }
    
    
    /*
     * Tests Calculating Distance Between Customer & Intercom
     * Method Under Test: HaversineFormulaSupport.calculateDistanceUsingHaversine()
     * Assert - true
     */
    func testHarversineFormulaSuccess() {
        
        var didCalculateDistanceFromIntercomCorrectly = Bool()
        
        let sampleCustomerLat: Double = 53.1489345
        let sampleCustomerLong: Double = -6.8422408
        let correctDistance: Double = 44.33856573057924
        var distance = Double()
            
        let haversineFormula = HaversineFormulaSupport()
        distance = haversineFormula.calculateDistanceUsingHaversine(
            customerLat: sampleCustomerLat,
            customerLong: sampleCustomerLong)
        
        if (distance.isEqual(to: correctDistance)) {
            didCalculateDistanceFromIntercomCorrectly = true
        } else {
            didCalculateDistanceFromIntercomCorrectly = false
        }
        assert(didCalculateDistanceFromIntercomCorrectly)
    }

    
    
    /*
     * Tests Calculating Distance Between Customer & Intercom
     * Method Under Test: HaversineFormulaSupport.calculateDistanceUsingHaversine()
     * Assert - false
     */
    func testHarversineFormulaFailure() {
        
        var didCalculateDistanceFromIntercomCorrectly = Bool()
        
        let sampleCustomerLat: Double = 53.1489345
        let sampleCustomerLong: Double = -6.8422408
        let incorrectDistance: Double = 61.33856573057924
        var distance = Double()
            
        let haversineFormula = HaversineFormulaSupport()
        distance = haversineFormula.calculateDistanceUsingHaversine(
            customerLat: sampleCustomerLat,
            customerLong: sampleCustomerLong)
        
        if (distance.isEqual(to: incorrectDistance)) {
            didCalculateDistanceFromIntercomCorrectly = true
        } else {
            didCalculateDistanceFromIntercomCorrectly = false
        }
        assert(!didCalculateDistanceFromIntercomCorrectly)
    }
    
  
    
    
    /*
     * Tests Successful Validation of Customer within 100 miles of Intercom
     * Method Under Test: DistanceValidator.isCustomerEligibleForInvite()
     * Assert - true
     */
    func testDistanceValidatorSuccess() {
        
        var isEligible = Bool()
        let distance: Double = 86.3
        
        let validator = DistanceValidator()
        isEligible = validator.isCustomerEligibleForInvite(distance: distance)
        
        assert(isEligible)
    }
    
    /*
     * Tests Failure to Validate if Customer within 100 miles of Intercom
     * Method Under Test: DistanceValidator.isCustomerEligibleForInvite()
     * Assert - false
     */
    func testDistanceValidatorFailure() {
        
        var isEligible = Bool()
        let distance: Double = 101.1
        
        let validator = DistanceValidator()
        isEligible = validator.isCustomerEligibleForInvite(distance: distance)
        
        assert(!isEligible)
    }
    

    /*
     * Tests converting a single line to a Customer object
     * Method Under Test: HomeViewController.convertEachLinetoJsonObject()
     * Assert - No Error Thrown
     */
    func testConvertingSingleLineToCustomerObjectSuccess() throws {
        let homeVC = HomeViewController()
        XCTAssertNoThrow(try homeVC.convertEachLinetoJsonObject(customerLine: customerLine))
    }
    
    
    /*
     * Tests converting a single line to a Customer object with null latitude value
     * Method Under Test: HomeViewController.convertEachLinetoJsonObject()
     * Assert - Error Thrown
     */
    func testConvertingSingleLineToCustomerObjectNullLatValueFailure() throws {
          let homeVC = HomeViewController()
          XCTAssertThrowsError(try homeVC.convertEachLinetoJsonObject(customerLine: customerLineNullLatValue))
    }
    
    
    /*
     * Tests converting a single line to a Customer object with null longitude value
     * Method Under Test: HomeViewController.convertEachLinetoJsonObject()
     * Assert - Error Thrown
     */
    func testConvertingSingleLineToCustomerObjectNullLongValueFailure() throws {
          let homeVC = HomeViewController()
          XCTAssertThrowsError(try homeVC.convertEachLinetoJsonObject(customerLine: customerLineNullLongValue))
    }
    
    
    /*
     * Tests converting a single line to a Customer object with null user_id value
     * Method Under Test: HomeViewController.convertEachLinetoJsonObject()
     * Assert - Error Thrown
     */
    func testConvertingSingleLineToCustomerObjectNullIDValueFailure() throws {
          let homeVC = HomeViewController()
          XCTAssertThrowsError(try homeVC.convertEachLinetoJsonObject(customerLine: customerLineNullIDValue))
    }
    
    
    /*
     * Tests converting a single line to a Customer object with null name value
     * Method Under Test: HomeViewController.convertEachLinetoJsonObject()
     * Assert - Error Thrown
     */
    func testConvertingSingleLineToCustomerObjectNullNameValueFailure() throws {
        let homeVC = HomeViewController()
        XCTAssertThrowsError(try homeVC.convertEachLinetoJsonObject(customerLine: customerLineNullNameValue))
    }
    
      
    /*
     * Test initalisation of Customer object
     * Assert - not nil
     */
    func testCustomerModelInitialisation() {
        let customer = CustomerModel.init(longitude: 53.1489345, latitude: -6.8422408, name: "Daniel Farrell", userId: 13)
        XCTAssertNotNil(customer)
    }
    
    
    /*
     * Test initalisation of Customer object & setting radian values after initialisation
     * Assert - not nil
     */
    func testCustomerModelSetRadians() {
        let customer = CustomerModel.init(longitude:  53.1489345, latitude: -6.8422408, name: "Daniel Farrell", userId: 13)
        
        customer.latRadian = 0.930948639728
        customer.longRadian = -0.10921684028
        
        XCTAssertTrue(customer.latRadian != nil && customer.longRadian != nil)
      }


}
