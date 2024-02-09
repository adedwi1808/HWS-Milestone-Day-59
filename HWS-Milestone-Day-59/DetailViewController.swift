//
//  DetailViewController.swift
//  HWS-Milestone-Day-59
//
//  Created by Ade Dwi Prayitno on 09/02/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameView: UILabel!
    @IBOutlet weak var currencyView: UILabel!
    @IBOutlet weak var capitalNameView: UILabel!
    @IBOutlet weak var languageView: UILabel!
    
    var name: String = ""
    var capital: String = ""
    var currency: String = ""
    var language: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupData()
    }
    
    func setupData() {
        nameView.text = "Name :" + name
        capitalNameView.text = "Capital Name :" + capital
        currencyView.text = "Currency :" + currency
        languageView.text = "Language :" + language
    }

}
