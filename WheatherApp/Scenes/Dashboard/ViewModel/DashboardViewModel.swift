//
//  DashboardViewModel.swift
//  WheatherApp
//
//  Created by Mahendra Vishwakarma on 17/12/21.
//

import Foundation


class DashboardViewModel {
    var webservice:WebServices?
    var model: WheatherModel?
    var selectedCity: WheatherModelElements?
    weak var delegate:WebResponseDelegate?
    var timer:Timer?
    var timeCounter = 0
    init() {
        webservice = WebServices()
        updateRefresh()
    }
    
    func updateRefresh() {
        if ((timer?.isValid) != nil) {
            timer?.invalidate()
        }
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {[weak self] (timer) in
            self?.timeCounter += 1
            self?.delegate?.updateTime(time: self?.timeCounter)
            if((self?.timeCounter ?? 0) >= 30) {
               self?.fetchWeatherData()
            }
        })
        fetchWeatherData()
    }
    func fetchWeatherData() {
        self.timeCounter = 0
        webservice?.fetchResponse(WheatherModel.self , completion: {[weak self] result in
            switch result {
            case .failure(let error):
                self?.delegate?.update(status: .failed,message:error.localizedDescription)
            case .success(let response):
                self?.model = response
                self?.selectedCity = self?.model?.first
                self?.delegate?.update(status: .success, message: nil)
            }
        })
    }
}
