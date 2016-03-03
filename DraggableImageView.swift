//
//  DraggableImageView.swift
//  Tinder
//
//  Created by Lee Edwards on 3/2/16.
//  Copyright © 2016 Lee Edwards. All rights reserved.
//

import UIKit

class DraggableImageView: UIView {
    @IBOutlet weak var imageView: UIImageView!

    @IBAction func onPanGesture(sender: AnyObject) {
        
        let translation = sender.translationInView(self)
        
        if sender.state == .Began {
            originalImageCenter = imageView.center
        } else if sender.state == .Changed {
            imageView.center = CGPoint(x: originalImageCenter!.x + translation.x, y: originalImageCenter!.y)
        } else if sender.state == .Ended {
            
        }
        
    }
    
    var image: UIImage? {
        get { return imageView.image }
        set { imageView.image = newValue }
    }
    
    var originalImageCenter: CGPoint?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {
        let nib = UINib(nibName: "DraggableImageView", bundle: nil)
        nib.instantiateWithOwner(self, options: nil)
        imageView.frame = bounds
        addSubview(imageView)
    }
}
