//
//  CardDetaildViewController.swift
//  RMDelegateWithCompletion
//
//  Created by Mobile Tech People on 08/03/2018.
//  Copyright © 2018 RedMakApps. All rights reserved.
//

import UIKit

protocol CardDetaildViewControllerDelegate {
    func didFillCardDetails(cardDetails: Dictionary<String, String>)
}

class CardDetaildViewController: UIViewController {

    @IBOutlet weak var cardNumberTextField: UITextField!
    @IBOutlet weak var cardExpirationDateTextField: UITextField!
    @IBOutlet weak var cardCryptoTextField: UITextField!
    
    var delegate: CardDetaildViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func validate(_ sender: Any) {
        // do tests for strings format
        // dissmiss and call callback
        self.dismiss(animated: true) {
            self.delegate?.didFillCardDetails(cardDetails: ["number": self.cardNumberTextField.text!,
                                                            "expirationDate": self.cardExpirationDateTextField.text!,
                                                            "crypto": self.cardCryptoTextField.text!])

        }
    }
}
