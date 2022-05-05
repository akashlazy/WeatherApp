//
//  WeatherListViewController.swift
//  Weather
//
//  Created by Akash Arun Jambhulkar (Digital) on 5/5/22.
//

import UIKit

class WeatherListViewController: UIViewController {
    
    private lazy var searchController: UISearchController = {
        
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//        let cityVC = storyBoard.instantiateViewController(withIdentifier: "CityListViewController") as! CityListViewController
//
        let sc = UISearchController(searchResultsController: nil)
        sc.obscuresBackgroundDuringPresentation = true
        sc.searchBar.placeholder = "Search for a city or airport"
        sc.searchBar.tintColor = .white
        sc.searchResultsUpdater = self
        sc.searchBar.delegate = self
        return sc
    }()
    
    @IBOutlet weak var tableView: UITableView!
    private let cellIdentifier = "CityWeatherCell"
    private let cellIdentifierCity = "CityNameCell"
    
    let cityVM = CityViewModel()
    
    private var isSearch = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Weather"
        self.navigationItem.titleView?.tintColor = .white
        
        self.navigationItem.searchController = searchController
        searchController.searchBar.textColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func loadCity(_ name: String) {
        cityVM.getCity(by: name, completionSucess: { success in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
}

extension WeatherListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearch {
            return cityVM.numberOfCity()
        }
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isSearch {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifierCity, for: indexPath) as? CityNameCell else {
                return UITableViewCell()
            }
            cell.lblCity.text = cityVM.displayCity(indexPath.row)
            debugPrint(cityVM.displayCity(indexPath.row))
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CityWeatherCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isSearch {
            return 50
        }
        return 128
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension WeatherListViewController: UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text  else {
            return
        }
        if text.count >= 3 {
            isSearch = true
            self.loadCity(text)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearch.toggle()
        tableView.reloadData()
    }
}
