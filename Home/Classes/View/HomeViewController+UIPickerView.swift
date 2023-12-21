//
//  HomeViewController+UIPickerView.swift
//  Home
//
//  Created by Aaron Andres Gaspar Peña on 11/12/23.
//

import Foundation

/// UIPickerDataSource
extension HomeViewController: UIPickerViewDataSource {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return homeViewModel?.yearsRange.count ?? 0 //CUANTOS ELEMENTOS HAY EN EL RANGO
    }
}

/// UIPickerViewDelegate
extension HomeViewController: UIPickerViewDelegate {
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return homeViewModel?.yearsRange[row]
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.doSearch()
    }
}
