//
//  ViewController.swift
//  Tinder
//
//  Created by Lee Edwards on 3/2/16.
//  Copyright © 2016 Lee Edwards. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    @IBOutlet weak var profileImageView: DraggableImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        profileImageView.image = UIImage(named: "ryan")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

