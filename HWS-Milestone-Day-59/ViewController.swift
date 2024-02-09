//
//  ViewController.swift
//  HWS-Milestone-Day-59
//
//  Created by Ade Dwi Prayitno on 09/02/24.
//

import UIKit

class ViewController: UITableViewController {
    var countries = Countries()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        
        tableView.register(UINib(nibName: CountryTVC.identifier, bundle: nil), forCellReuseIdentifier: CountryTVC.identifier)
    }
    
    func fetchData() {
        Task {
            await getCountriesData()
        }
    }
    
    @MainActor
    func getCountriesData() async {
        let url: URL = URL(string: "https://restcountries.com/v3.1/all")!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            parseGetCountriesDataResponse(with: data)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func parseGetCountriesDataResponse(with data: Data) {
        do {
            countries = try JSONDecoder().decode(Countries.self, from: data)
            tableView.reloadData()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}

extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            
            let data: Country = countries[indexPath.row]
            
            vc.name = data.name?.common ?? ""
            vc.capital = data.capital?.first ?? ""
            vc.currency = "-"
            vc.language = data.languages?.first?.value ?? ""
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountryTVC.identifier, for: indexPath) as? CountryTVC else { return UITableViewCell() }
        
        let data = countries[indexPath.row]
        
        cell.setTitle(title: data.name?.common ?? "-")
        
        return cell
    }
}

