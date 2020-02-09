//
//  CustomerModel.swift
//  Intercom-Tech-Test
//
//  Created by Daniel Farrell on 07/02/2020.
//  Copyright © 2020 Daniel Farrell. All rights reserved.
//

import Foundation


class CustomerModel {
    
    var longitude: Double!
    var latitude: Double!
    var name: String!
    var userId: Int!
    
    var latRadian: Double?
    var longRadian: Double?
    
    
    init(longitude: Double, latitude: Double, name: String, userId: Int) {
        
        self.longitude = longitude
        self.latitude = latitude
        self.name = name
        self.userId = userId
    }

    
}
