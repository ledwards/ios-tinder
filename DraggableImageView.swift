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
            originalImageCenter = imageView.center.x
            originalRotation = CGFloat(atan2f(Float(imageView.transform.b), Float(imageView.transform.a)))
        } else if sender.state == .Changed {
            imageView.center.x = originalImageCenter! + translation.x
            let delta = (translation.x / imageView.frame.width) * CGFloat(M_PI / 4.0)
            imageView.transform = CGAffineTransformMakeRotation(originalRotation! + delta)
        } else if sender.state == .Ended {
            if translation.x < CGFloat(-50.0) {
                UIView.animateWithDuration(0.3, animations: {
                    self.imageView.center.x = self.originalImageCenter! - 400.0
                    self.imageView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI / -4))
                })
            } else if translation.x > CGFloat(50.0) {
                UIView.animateWithDuration(0.3, animations: {
                    self.imageView.center.x = self.originalImageCenter! + 400.0
                    self.imageView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI / 4))
                })
            } else {
                    
                imageView.transform = CGAffineTransformIdentity
                imageView.center.x = self.originalImageCenter!
            }
        }
        
    }
    
    var image: UIImage? {
        get { return imageView.image }
        set { imageView.image = newValue }
    }
    
    var originalImageCenter: CGFloat?
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
