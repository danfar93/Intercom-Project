//
//  IntercomUnitTests.swift
//  IntercomUnitTests
//
//  Created by Daniel Farrell on 07/02/2020.
//  Copyright © 2020 Daniel Farrell. All rights reserved.
//

import XCTest

class IntercomUnitTests: XCTestCase {


    /*
     * Tests Converting Degrees to Radians
     * DegreesConverterSupport.convertDegreesToRadians()
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
     * DegreesConverterSupport.convertDegreesToRadians()
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
     * HaversineFormulaSupport.calculateDistanceUsingHaversine()
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
     * HaversineFormulaSupport.calculateDistanceUsingHaversine()
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
     * InviteValidator.isCustomerEligibleForInvite()
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
     * InviteValidator.isCustomerEligibleForInvite()
     * Assert - false
     */
    func testDistanceValidatorFailure() {
        
        var isEligible = Bool()
        let distance: Double = 101.1
        
        let validator = DistanceValidator()
        isEligible = validator.isCustomerEligibleForInvite(distance: distance)
        
        assert(!isEligible)
    }
    

}
