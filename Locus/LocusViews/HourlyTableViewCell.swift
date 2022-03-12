//
//  HourlyTableViewCell.swift
//  Locus
//
//  Created by Lakshmi H R on 11/03/22.
//

import Foundation
import UIKit

class HourlyTableViewCell : UITableViewCell {
    //    MARK: - IBOutlets and Variables
    @IBOutlet weak var hourlyCollectionView: UICollectionView!
    
    //    MARK: - Configure cell methods
    func configureHourlyTableViewCell() {
        hourlyCollectionView.register(UINib(nibName:.hourlyCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: .hourlyCollectionViewCell)
        hourlyCollectionView.reloadData()
    }
    
}
