//
//  Statistics.swift
//  Lucror
//
//  Created by Shreya Ravi on 3/21/21.
//

import UIKit

class Statistics: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapHome() {
        let vc = storyboard?.instantiateViewController(identifier: "Home")as! ViewController
        vc.modalPresentationStyle = .fullScreen
        present (vc,animated:true)
    }

}
