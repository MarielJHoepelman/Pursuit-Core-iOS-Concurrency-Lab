//
//  CountriesViewController.swift
//  iOS-Concurrency-Lab
//
//  Created by Mariel Hoepelman on 9/3/19.
//  Copyright © 2019 Mariel Hoepelman. All rights reserved.
//

import UIKit

class CountriesViewController: UIViewController {
    
    let countriesURL = "https://restcountries.eu/rest/v2/name/united"
    
    private var countries = [Countries]() {
        didSet {
            DispatchQueue.main.async {
                self.countriesTableView.reloadData()
            }
        }
    }
    
    
    @IBOutlet weak var countriesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        countriesTableView.delegate = self
        countriesTableView.dataSource = self
        
    }
    
    func loadData() -> Void {
        APIClient.shared.fetchDataForAnyURL(url: countriesURL) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let countriesWrapper):
                self.countries = Countries.getCountry(data: countriesWrapper)!
            }
        }
    }
}

extension CountriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = countriesTableView.dequeueReusableCell(withIdentifier: "countryCell")
        cell?.textLabel?.text = countries[indexPath.row].name
//        cell?.imageView?.image = UIImageView ???
        cell?.textLabel?.numberOfLines = 0
        return cell!
    }
}

extension CountriesViewController: UITableViewDelegate {
    
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
