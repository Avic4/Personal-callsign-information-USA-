//
//  DetailViewController.swift
//  Callook Usa
//
//  Created by Сергей Митрофанов on 24/09/2017.
//  Copyright © 2017 Wipline. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: Properties
    var detail: Information?
    
    //MARK: Outlets
    @IBOutlet weak var details: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if let detail = detail {
            details.text = detail.name + " " + (detail.address?.line1)! + " " + (detail.location?.latitude)! + " " + (detail.location?.longitude)!
        } else { details.text = "Error getting details" }
    }
    
    //MARK: Actions
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}
