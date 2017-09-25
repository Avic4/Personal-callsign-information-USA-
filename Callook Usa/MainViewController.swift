//
//  ViewController.swift
//  Callook Usa
//
//  Created by Сергей Митрофанов on 22/09/2017.
//  Copyright © 2017 Wipline. All rights reserved.
//

import UIKit
import MBProgressHUD

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: Properties
    var callsignsList = [Information]()
    var index = 0
    
    //MARK: IBOutlets
    @IBOutlet weak var callsign: UITextField!
    @IBOutlet weak var search: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: Touches
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if touches.first != nil {
            view.endEditing(true)
        }
    }
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            if let cell = sender as? UITableViewCell {
                if let indexPath = tableView.indexPath(for: cell) {
                    destination.detail = callsignsList[indexPath.row]
                }
            }
        }
    }
    
    //MARK: Actions
    @IBAction func searchTouch(_ sender: UIButton) {
        if (callsign.text?.isEmpty)! {
            let alert = UIAlertController(title: "Error", message: "Please input callsign", preferredStyle: UIAlertControllerStyle.alert)
            let cancelAction = UIAlertAction(title: "ОК", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            self.present(alert, animated: true)
        } else {
            MBProgressHUD.showAdded(to: view, animated: true)
            Connection.request(callsign: callsign.text!) { (results:[Information]) in
                for result in results {
                    self.callsignsList.append(result)
                }
                DispatchQueue.main.async {
                    MBProgressHUD.hide(for: self.view, animated: true)
                    self.tableView.beginUpdates()
                    self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
                    self.tableView.endUpdates()
                }
        }
    }
    }
    
    //MARK: Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return callsignsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "callsign", for: indexPath)
        cell.textLabel?.text = callsign.text
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segue", sender: self)
    }
}
