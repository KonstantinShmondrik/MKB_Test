//
//  RatesTableViewController.swift
//  MKB Test
//
//  Created by Константин Шмондрик on 21.04.2022.
//

import UIKit

class RatesTableViewController: UITableViewController {
    
    
    var ratesAPI = RatesAPI()
    private var rateData: [RateData] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "HeaderRatesTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderRatesTableViewCell")
        
        refreshRates()
        setupRefreshControl()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return rateData.first?.rates.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RatesTableViewCell", for: indexPath) as? RatesTableViewCell else {return UITableViewCell()}
        
        let currMnemFrom = rateData.first?.rates[indexPath.item].currMnemFrom.rawValue ?? ""
        let currMnemTo = rateData.first?.rates[indexPath.item].currMnemTo ?? ""
        let name = rateData.first?.rates[indexPath.item].name ?? ""
        let sale = rateData.first?.rates[indexPath.item].sale ?? ""
        let from = rateData.first?.rates[indexPath.item].from ?? 0
        let to = rateData.first?.rates[indexPath.item].to ?? 0
        let deltaBuy = rateData.first?.rates[indexPath.item].deltaBuy ?? ""
        let deltaSale = rateData.first?.rates[indexPath.item].deltaSale ?? ""
        let buy = rateData.first?.rates[indexPath.item].buy ?? ""
        let tp = rateData.first?.rates[indexPath.item].tp ?? 0
        let basic = rateData.first?.rates[indexPath.item].basic ?? ""
        
        cell.config(currMnemFrom: currMnemFrom,
                    currMnemTo: currMnemTo,
                    name: name,
                    sale: sale,
                    from: from,
                    to: to,
                    deltaBuy: deltaBuy,
                    deltaSale: deltaSale,
                    buy: buy,
                    tp: tp,
                    basic: basic)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = Bundle.main.loadNibNamed("HeaderRatesTableViewCell", owner: self, options: nil)?.first as? HeaderRatesTableViewCell else {return UITableViewCell()}
        
        let ratesDate = rateData.first?.ratesDate ?? ""
        let messageTitle = rateData.first?.messageTitle ?? ""
        let code = rateData.first?.code ?? 0
        let rid = rateData.first?.rid ?? ""
        let message = rateData.first?.message ?? ""
        let downloadDate = rateData.first?.downloadDate ?? ""
        let productState = rateData.first?.productState ?? 0
        
        
        header.configurate(ratesDate: ratesDate,
                           messageTitle: messageTitle,
                           code: code,
                           rid: rid,
                           message: message,
                           downloadDate: downloadDate,
                           productState: productState)
        
        return header
    }
    
    
    // MARK: - Privat
    
    fileprivate func setupRefreshControl() {
        
        refreshControl = UIRefreshControl()
        refreshControl?.attributedTitle = NSAttributedString(string: "Refreshing...")
        refreshControl?.tintColor = .gray
        refreshControl?.addTarget(self, action: #selector(refreshRates), for: .valueChanged)
    }
    
    // MARK: - Actions
    
    @objc func refreshRates(){
        
        self.refreshControl?.beginRefreshing()
        
        ratesAPI.postRates { [weak self] rateData in
            guard let self = self else {return}
            self.rateData = rateData
            self.tableView.reloadData()
        }
        
        self.refreshControl?.endRefreshing()
    }
    
}
