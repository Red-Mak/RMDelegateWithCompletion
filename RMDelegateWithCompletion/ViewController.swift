//
//  ViewController.swift
//  RMDelegateWithCompletion
//
//  Created by Mobile Tech People on 08/03/2018.
//  Copyright © 2018 RedMakApps. All rights reserved.
//

import UIKit
import PayementFramework

typealias CardCompletion = (Dictionary<String, String>) -> Void

class ViewController: UIViewController {

    
    var cardCompletion: CardCompletion?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func payAction(_ sender: Any) {
        let paymentManager = PaymentManager()
        paymentManager.delegate = self
        paymentManager.proceedToCheckout(items: ["key_1":"value_1", "key_2":"value_2"]) { (error) in
            
        }
    }
}

extension ViewController: PaymentManagerDelegate{
    func creditCardNeeded(error: NSError, completion: @escaping (Dictionary<String, String>) -> Void) {
        // if you already have the card details you can just return it back to the PayementFramework
        // in our case no deatils found, we need to display a viewController so the user can fill details
        self.cardCompletion = completion
        let cardDetailsVC = CardDetaildViewController()
        cardDetailsVC.delegate = self
        self.present(cardDetailsVC, animated: true, completion: nil)
    }
}

extension ViewController: CardDetaildViewControllerDelegate{
    func didFillCardDetails(cardDetails: Dictionary<String, String>) {
        self.cardCompletion!(cardDetails)
    }
}
