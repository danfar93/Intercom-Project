//
//  InviteValidator.swift
//  Intercom-Tech-Test
//
//  Created by Daniel Farrell on 07/02/2020.
//  Copyright © 2020 Daniel Farrell. All rights reserved.
//

import Foundation

class DistanceValidator {
    
    /*
     * Validates if the customer is eligible for invite using
     * distance from Haversine Formula
     *
     * return Bool
     */
    func isCustomerEligibleForInvite(distance: Double) -> Bool {
        
        var isEligibleForInvite = Bool()
         
         if (distance < 100) {
            isEligibleForInvite = true
         } else {
            isEligibleForInvite = false
         }
        
        return isEligibleForInvite
    }
    
    
}
