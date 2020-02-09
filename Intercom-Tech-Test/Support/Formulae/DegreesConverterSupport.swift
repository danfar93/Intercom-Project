//
//  DegreesConverterSupport.swift
//  Intercom-Tech-Test
//
//  Created by Daniel Farrell on 07/02/2020.
//  Copyright © 2020 Daniel Farrell. All rights reserved.
//

import Foundation



class DegreesConverterSupport {
    
    /*
     * Converts Degrees to Radians
     * return Double
     */
    func convertDegreesToRadians(degree: Double) -> (Double) {
        var radian = Double()
        radian = (degree * 3.14 / 180)
        
        return radian
    }
        
}
