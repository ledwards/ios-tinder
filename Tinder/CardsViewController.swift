//
//  ViewController.swift
//  Tinder
//
//  Created by Lee Edwards on 3/2/16.
//  Copyright © 2016 Lee Edwards. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBAction func onPan(sender: AnyObject) {
        let translation = sender.translationInView(view)
        
        if sender.state == .Began {
            originalProfileCenter = profileImageView.center
        } else if sender.state == .Changed {
            profileImageView.center = CGPoint(x: originalProfileCenter!.x + translation.x, y: originalProfileCenter!.y)
        } else if sender.state == .Ended {
            
        }
        
    }
    
    var originalProfileCenter: CGPoint?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

