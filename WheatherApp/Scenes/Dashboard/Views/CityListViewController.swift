//
//  CityListViewController.swift
//  WheatherApp
//
//  Created by Mahendra Vishwakarma on 19/12/21.
//

import UIKit

class CityListViewController: UIViewController {

    @IBOutlet weak var cityView: UIView!
    @IBOutlet weak var chooseButton: UIButton!
    @IBOutlet weak var cityTableView: UITableView!
    var selectedCity: WheatherModelElements?
    var viewModel:DashboardViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        basicSetUp()
    }
    private func basicSetUp() {
        cityView.layer.cornerRadius = 20
        cityView.layer.masksToBounds = true
        chooseButton.layer.cornerRadius = 15
        
        cityTableView.dataSource = self
        cityTableView.delegate = self
        cityTableView.register(UINib(nibName: CityTableViewCell.identifier, bundle: .main), forCellReuseIdentifier:  CityTableViewCell.identifier)
        
    }
    @IBAction func closeButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    @IBAction func chooseCity(_ sender: Any) {
        if let city = selectedCity {
            viewModel?.selectedCity = city
            viewModel?.delegate?.update(status: .success, message: "update city")
            self.dismiss(animated: true)
        }
       
    }
    
}

extension CityListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.model?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:  CityTableViewCell.identifier, for: indexPath)
        cell.textLabel?.text = viewModel?.model?[indexPath.row].city
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedCity = viewModel?.model?[indexPath.row]
    }
}
