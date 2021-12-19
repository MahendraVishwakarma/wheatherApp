//
//  DashboardViewController.swift
//  WheatherApp
//
//  Created by Mahendra Vishwakarma on 17/12/21.
//

import UIKit
import WheatherGraph

class DashboardViewController: UIViewController {
    var viewModel:DashboardViewModel?
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var dropDownView: UIView!
    @IBOutlet weak var apiGraphView: WheatherGraphView!
    @IBOutlet weak var cityNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
       
    }
    private func basicSetUp() {
        dropDownView.setShadow(color: .red,cornerRadius:20, opacity: 1, offSet: CGSize(width: 0, height: 0), radius: 10, scale: true)
    }
    
    @IBAction func showCityList(_ sender: Any) {
        let cityVC = CityListViewController()
        cityVC.modalPresentationStyle = .custom
        cityVC.viewModel = self.viewModel
        self.present(cityVC, animated: true)
    }
    @IBAction func updateAPI(_ sender: Any) {
        self.viewModel?.updateRefresh()
    }
    override func viewDidLayoutSubviews() {
        basicSetUp()
    }
}

extension DashboardViewController: WebResponseDelegate {
    func update(status: Status, message: String?) {
        
        status == .success ? DispatchQueue.main.async {
            self.cityNameLabel.text = self.viewModel?.selectedCity?.city
            if let aqi = self.viewModel?.selectedCity?.aqi {
                self.apiGraphView.setAQI(api: aqi.rounded(toPlaces: 2))
            }
            
        } : DispatchQueue.main.async {
            self.cityNameLabel.text = message
            self.apiGraphView.setAQI(api: 0.0)
        }
        
    }
    func updateTime(time: Int?) {
        DispatchQueue.main.async {
            let tipText: String = String(format: "%.2d", (time ?? 0))
            self.timerLabel.text = "updated in \(tipText) seconds."
       }
       
    }
    
}
