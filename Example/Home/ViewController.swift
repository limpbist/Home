//
//  ViewController.swift
//  Home
//
//  Created by Aaron on 12/18/2023.
//  Copyright (c) 2023 Aaron. All rights reserved.
//

import UIKit
import Home

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let homeViewController = HomeViewFactory.getFirstView()
        else {return}
        self.navigationController?.pushViewController(homeViewController, animated: true)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

