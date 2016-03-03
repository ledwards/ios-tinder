//
//  DraggableImageView.swift
//  Tinder
//
//  Created by Lee Edwards on 3/2/16.
//  Copyright © 2016 Lee Edwards. All rights reserved.
//

import UIKit

class DraggableImageView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!

    @IBAction func onPanGesture(sender: AnyObject) {
        
        let translation = sender.translationInView(self)
        
        if sender.state == .Began {
            originalImageCenter = imageView.center
            originalRotation = CGFloat(atan2f(Float(imageView.transform.b), Float(imageView.transform.a)))
        } else if sender.state == .Changed {
            imageView.center = CGPoint(x: originalImageCenter!.x + translation.x, y: originalImageCenter!.y)
            let delta = (translation.x / imageView.frame.width) * CGFloat(M_PI / 4.0)
            imageView.transform = CGAffineTransformMakeRotation(originalRotation! + delta)
        } else if sender.state == .Ended {
        }
        
    }
    
    var image: UIImage? {
        get { return imageView.image }
        set { imageView.image = newValue }
    }
    
    var originalImageCenter: CGPoint?
    var originalRotation: CGFloat?
    
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
        contentView.frame = bounds
        addSubview(contentView)
    }
}
