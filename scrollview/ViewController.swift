//
//  ViewController.swift
//  scrollview
//
//  Created by AlienLi on 16/1/24.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollView.directionalLockEnabled = true
    }

    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

