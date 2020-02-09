//
//  HaversineFormulaSupport.swift
//  Intercom-Tech-Test
//
//  Created by Daniel Farrell on 07/02/2020.
//  Copyright © 2020 Daniel Farrell. All rights reserved.
//

import Foundation

class HaversineFormulaSupport {
    
    let converter = DegreesConverterSupport()
    
    /*
     * Uses Customer Latitude & Longitude to calculate distance from Intercom Office
     * using the Haversine Formula
     *
     * return Double
     */
    func calculateDistanceUsingHaversine(customerLat: Double, customerLong: Double) -> Double {
        
        //Intercom Dublin Office
        let intercomLat: Double = 53.339428
        let intercomLong: Double = -6.257664
        
        let intercomLatRadian = converter.convertDegreesToRadians(degree: intercomLat)
        let intercomLongRadian = converter.convertDegreesToRadians(degree: intercomLong)
        
        let customerLatRadian = converter.convertDegreesToRadians(degree: customerLat)
        let customerLongRadian = converter.convertDegreesToRadians(degree: customerLong)
        
        let radiusKm: Double = 6378.0
        
        let deltaP = (intercomLatRadian - customerLatRadian)
        let deltaL = (intercomLongRadian - customerLongRadian)
        
        let a = sin(deltaP/2) * sin(deltaP/2) + cos(customerLatRadian) * cos(intercomLatRadian) * sin(deltaL/2) * sin(deltaL/2)
        let c = 2 * atan2(sqrt(a), sqrt(1-a))
        let distanceFromIntercomOffice = radiusKm * c
        
        return distanceFromIntercomOffice
    }
    
    
}
