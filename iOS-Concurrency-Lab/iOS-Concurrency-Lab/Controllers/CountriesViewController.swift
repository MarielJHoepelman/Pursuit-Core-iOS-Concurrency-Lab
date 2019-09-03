//
//  CountriesViewController.swift
//  iOS-Concurrency-Lab
//
//  Created by Mariel Hoepelman on 9/3/19.
//  Copyright © 2019 Mariel Hoepelman. All rights reserved.
//

import UIKit

class CountriesViewController: UIViewController {

    @IBOutlet weak var countriesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countriesTableView.delegate = self
        countriesTableView.dataSource = self
    }

}

extension CountriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = countriesTableView.dequeueReusableCell(withIdentifier: "countryCell")
        cell?.textLabel?.text = "test"
        cell?.textLabel?.numberOfLines = 0
        return cell!
    }
}

extension CountriesViewController: UITableViewDelegate {
    
}
