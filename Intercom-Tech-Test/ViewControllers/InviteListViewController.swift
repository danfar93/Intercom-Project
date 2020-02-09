//
//  InviteListViewController.swift
//  Intercom-Tech-Test
//
//  Created by Daniel Farrell on 07/02/2020.
//  Copyright © 2020 Daniel Farrell. All rights reserved.
//

import UIKit

class InviteListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var invitedCustomersTableView: UITableView!
    var invitedCustomersDestArray = [CustomerModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createInvitedCustomerOutputTxt()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return invitedCustomersDestArray.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 118
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = invitedCustomersTableView.dequeueReusableCell(withIdentifier: "customerCell") as! InvitedCustomerCell
        
        cell.selectionStyle = .none

        let customerName = invitedCustomersDestArray[indexPath.row].name
        cell.customerNameLabel.text = "Name: \(customerName!)"
        
        let userIdString = invitedCustomersDestArray[indexPath.row].userId
        cell.userIdLabel.text = "User ID: \(userIdString!)"
        
        return cell
    }
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "backSegue", sender: self)
    }
    
    
    /*
     * Converts invitedCustomersDestArray of CustomerModel into array of Strings
     * and writes the result to output.txt file
     */
    func createInvitedCustomerOutputTxt() {
        
        var customersStringsArray = [String]()
        
        for customer in invitedCustomersDestArray {
            let customerString = "Customer Name: \(customer.name!) - User ID: \(customer.userId!)"
            customersStringsArray.append(customerString)
        }
        let joined = customersStringsArray.joined(separator: "\n")
        let outputFile = "output.txt"
        let url = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(outputFile)
        let data = Data(joined.utf8)
        do {
            try data.write(to: url, options: .atomic)
        } catch {
            print(error)
        }
    }
    


}
