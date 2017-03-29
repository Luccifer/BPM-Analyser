//
//  ViewController.swift
//  BPMAnalyser
//
//  Created by Gleb Karpushkin on 29/03/2017.
//  Copyright © 2017 Gleb Karpushkin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(getTestBPM())
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getTestBPM() -> String {
        guard let filePath = Bundle.main.path(forResource: "TestMusic", ofType: "m4a"),
            let url = URL(string: filePath) else {return "error occured, check fileURL"}
        return BPMAnalyzer.core.getBpmFrom(url)
    }

}

