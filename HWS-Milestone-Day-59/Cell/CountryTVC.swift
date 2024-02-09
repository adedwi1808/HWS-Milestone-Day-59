//
//  CountryTVC.swift
//  HWS-Milestone-Day-59
//
//  Created by Ade Dwi Prayitno on 09/02/24.
//

import UIKit

class CountryTVC: UITableViewCell {
    static let identifier: String = "CountryTVC"
    
    @IBOutlet weak var titleView: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setTitle(title: String) {
        titleView.text = title
    }
    
}
