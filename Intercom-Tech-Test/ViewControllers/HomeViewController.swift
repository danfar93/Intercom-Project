//
//  HomeViewController.swift
//  Intercom-Tech-Test
//
//  Created by Daniel Farrell on 07/02/2020.
//  Copyright © 2020 Daniel Farrell. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var getInviteListButton: UIButton!
    
    var allCustomersArray = [CustomerModel]()
    var invitedCustomersArray = [CustomerModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getInviteListButton.layer.cornerRadius = 26
    }
    
    
    
    /*
     * Converts customers.txt to a String and seperates by line
     */
      func convertTxtFileToCustomerLinesArray()  {
    
        var customerFileString = String()
        
            if let path = Bundle.main.path(forResource: "customers", ofType: "txt") {
                do {
                    customerFileString = try String(contentsOfFile: path, encoding: .utf8)
                    let customerLinesArray = customerFileString.components(separatedBy: .newlines)
                    
                    for customerLine in customerLinesArray {
                        convertEachLinetoJsonObject(customerLine: customerLine)
                    }
   
                } catch {
                    print(error)
                }
            }
        }

    
    
    /*
     * Converts each line of customers.txt to JSON Objects and adds customers
     * to allCustomersArray & invitedCustomersArray
     */
    func convertEachLinetoJsonObject(customerLine: String) {
        
        let data = Data(customerLine.utf8)
        
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                
                let lat = (json["latitude"] as! NSString).doubleValue
                let long = (json["longitude"] as! NSString).doubleValue
                let userId = json["user_id"] as! Int
                let name = json["name"] as! String
                
                let customer = CustomerModel.init(longitude: long, latitude: lat, name: name, userId: userId)
                self.allCustomersArray.append(customer)
                
                if (customerInviteValidator(customer: customer)) {
                    self.invitedCustomersArray.append(customer)
                }
            }
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
        }
    }
    
    
    
    /*
     * Validates each customer using Haversine Formula & Distance Validator
     * return Bool
     */
    func customerInviteValidator(customer: CustomerModel) -> Bool {
        
        let haversineFormula = HaversineFormulaSupport()
        let validator = DistanceValidator()
        // use haversine formula to calculate distance
        let distanceFromIntercom = haversineFormula.calculateDistanceUsingHaversine(customerLat: customer.latitude, customerLong: customer.longitude)
        // use distance from haversine formula
        let isCustomerEligible = validator.isCustomerEligibleForInvite(distance: distanceFromIntercom)
        
        return isCustomerEligible
    }
    
    
    /*
     * Sort invitedCustomersArray by userId ascending & pass to destination view controller
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if (segue.identifier == "inviteSegue") {
            let destinationViewController = segue.destination as? InviteListViewController
            destinationViewController?.invitedCustomersDestArray = invitedCustomersArray.sorted(by: { $0.userId < $1.userId })
          }
      }
    
    
    @IBAction func getInviteListPressed(_ sender: Any) {
        convertTxtFileToCustomerLinesArray()
        performSegue(withIdentifier: "inviteSegue", sender: self)
    }
    
}

