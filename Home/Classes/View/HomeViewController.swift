//
//  HomeViewController.swift
//  Home
//
//  Created by Aaron Andres Gaspar Peña on 22/11/23.
//

import UIKit
import CoreBootcamp
import CoreEntities

public class HomeViewController:UIViewController {
    var homeViewModel: HomeViewModelProtocol?
    @IBOutlet weak var actIndFetchData: UIActivityIndicatorView!
    
    @IBOutlet weak var homeTableView: UITableView!
    
    @IBOutlet weak var txtTopic: UITextField!

    @IBOutlet weak var pickerYear: UIPickerView!

    @IBAction func tapBackRoot(_ sender: Any) {
        _ = FileHelper.clearCoversCache()
        //self.navigationController?.popToRootViewController(animated: true)
    }
    
    /*func doSearch () {
        if let topicText = txtTopic.text {
            let requestParameters = AnimeRequestParameters(
                topic: topicText,
                startDate: (homeViewModel?.yearsRange[pickerYear.selectedRow(inComponent: 0)] ?? "0")+"-01-01",
                endDate: (homeViewModel?.yearsRange[pickerYear.selectedRow(inComponent: 1)] ?? "0")+"-01-01")
            print("requestParameters: \(requestParameters)")
        }
    }*/
    
    func doSearch () {
        if let topicText = txtTopic.text {
            homeViewModel?.requestList(
                topic: topicText,
                startDate: (homeViewModel?.yearsRange[pickerYear.selectedRow(inComponent: 0)] ?? "0")+"-01-01" ,
                endDate: (homeViewModel?.yearsRange[pickerYear.selectedRow(inComponent: 1)] ?? "0")+"-01-01"
            )
        }

    }
    
    @IBAction func tapSearch(_ sender: Any) {
        doSearch()
    }
    
    public override func viewDidLoad() {
        let dataSource = AnimeRemoteDataSource()
        let repository = RemoteAnimeRepository(dataSource: dataSource)
        let useCase = AnimeListingUseCase(animeRepository: repository)
        homeViewModel = HomeViewModel(useCase: useCase)
        homeViewModel?.delegate = self
     }
 }

extension HomeViewController: HomeViewModelDelegateProtocol {
    func homeEvent(state: ViewControllerState) {
        switch state {
        case .success:
            actIndFetchData.stopAnimating()
            homeTableView.reloadData()
        case .loading:
            self.txtTopic.backgroundColor = UIColor.clear
            actIndFetchData.startAnimating()
            print("loading")
        case .error:
            actIndFetchData.stopAnimating()
            self.txtTopic.backgroundColor = UIColor.red
            print("error")
        }
    }
}


