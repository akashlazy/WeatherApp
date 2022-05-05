////
////  CityListViewController.swift
////  Weather
////
////  Created by Akash Arun Jambhulkar (Digital) on 5/5/22.
////
//
//import UIKit
//
//class CityListViewController: UIViewController {
//
//    @IBOutlet weak var tableView: UITableView!
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        tableView.delegate = self
//        tableView.dataSource = self
//
////        tableView.register(CityNameCell.self, forCellReuseIdentifier: cellIdentifier)
//        
////        loadCity()
//    }
//    
//    func loadCity(_ name: String) {
////        cityVM.getCity(by: name, completionSucess: { success in
////            DispatchQueue.main.async {
////                self.tableView.reloadData()
////            }
////        })
//    }
//}
//
//extension CityListViewController: UITableViewDelegate, UITableViewDataSource {
//    
//    // MARK: - Table view data source
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return cityVM.numberOfCity()
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityNameCell", for: indexPath) as? CityNameCell else {
//            return UITableViewCell()
//        }
//        
//        return cell
//    }
//}
