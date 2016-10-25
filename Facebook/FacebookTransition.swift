//
//  FacebookTransition.swift
//  Facebook
//
//  Created by Bryan Parker on 10/24/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class FacebookTransition: BaseTransition {
    
    var overlayView: UIView!
    var imageView: UIImageView!

    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let tabViewController = fromViewController as! UITabBarController
        let navigationController = tabViewController.selectedViewController as! UINavigationController
        let newsFeedViewController = navigationController.topViewController as! NewsFeedViewController
        let photoViewController = toViewController as! PhotoViewController
        
        newsFeedViewController.selectedImageView.isHidden = true
        photoViewController.imageView.isHidden = true
        
        imageView = UIImageView()
        imageView.image = newsFeedViewController.selectedImageView.image
        let frame = containerView.convert(newsFeedViewController.selectedImageView.frame, from: newsFeedViewController.selectedImageView.superview)
        imageView.frame = frame
        imageView.contentMode = newsFeedViewController.selectedImageView.contentMode
        imageView.clipsToBounds = newsFeedViewController.selectedImageView.clipsToBounds
        
        containerView.addSubview(imageView)
        
        overlayView = UIView()
        overlayView.frame = CGRect(x: 0, y: 0, width: toViewController.view.frame.size.width, height: toViewController.view.frame.size.height)
        
        toViewController.view.alpha = 0
        
        overlayView.backgroundColor = UIColor(white: 0, alpha: 0)
        fromViewController.view.addSubview(overlayView)
        
        UIView.animate(withDuration: duration, animations: {
            toViewController.view.alpha = 1
            
            self.imageView.frame = photoViewController.imageView.frame
            self.overlayView.backgroundColor = UIColor(white: 0, alpha: 0.6)

            
        }) { (finished: Bool) -> Void in
            
            newsFeedViewController.selectedImageView.isHidden = false
            photoViewController.imageView.isHidden = false
            self.imageView.removeFromSuperview()
            
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
  
        let tabViewController = toViewController as! UITabBarController
        let navigationController = tabViewController.selectedViewController as! UINavigationController
        let newsFeedViewController = navigationController.topViewController as! NewsFeedViewController
        let photoViewController = fromViewController as! PhotoViewController
        
        newsFeedViewController.selectedImageView.isHidden = true
        photoViewController.imageView.isHidden = true
        
        imageView = UIImageView()
        imageView.image = photoViewController.imageView.image
        let frame = containerView.convert(photoViewController.imageView.frame, from: photoViewController.imageView.superview)
        imageView.frame = frame
        imageView.contentMode = photoViewController.imageView.contentMode
        imageView.clipsToBounds = photoViewController.imageView.clipsToBounds
        
        containerView.addSubview(imageView)
        
        fromViewController.view.alpha = 1
        
        UIView.animate(withDuration: duration, animations: {
            
            fromViewController.view.alpha = 0
            
            self.imageView.frame = newsFeedViewController.selectedImageView.frame
            
            self.overlayView.backgroundColor = UIColor(white: 0, alpha: 0)
            self.overlayView.removeFromSuperview()
            
        }) { (finished: Bool) -> Void in
            
            newsFeedViewController.selectedImageView.isHidden = false
            photoViewController.imageView.isHidden = false
            self.imageView.removeFromSuperview()
            
            self.finish()
        }
    }
    
}
