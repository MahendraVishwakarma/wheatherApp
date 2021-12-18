//
//  DashboardViewController.swift
//  WheatherApp
//
//  Created by Mahendra Vishwakarma on 17/12/21.
//

import UIKit
import WheatherGraph

class DashboardViewController: UIViewController {

    @IBOutlet weak var apiGraphView: WheatherGraphView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        apiGraphView.setAQI(api: 100.0)
      
    }
    

}
