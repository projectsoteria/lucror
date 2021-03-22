//
//  ViewController.swift
//  Lucror
//
//  Created by Shreya Ravi on 2/26/21.
//

import UIKit
class ViewController: UIViewController {
    @IBOutlet var reccomendation : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(didGetNotification), name: Notification.Name("text"), object: nil)
    }
    @objc func didGetNotification(notification:Notification){
            let text = notification.object as! String?
            reccomendation.text = text
   }
    @IBAction func didTapButton() {
            let vc = storyboard?.instantiateViewController(identifier :"Upload_Score")as! Upload_Score

            vc.modalPresentationStyle = .fullScreen
            present (vc,animated:true)
}
    @IBAction func didTapGraph() {
        let vc = storyboard?.instantiateViewController(identifier: "Statistics")as! Statistics
        vc.modalPresentationStyle = .fullScreen
        present (vc,animated:true)
    }
}

