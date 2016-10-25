//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Parker, Bryan on 10/24/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var actionsBar: UIImageView!
    
    var image: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
 
        // Do any additional setup after loading the view.

        scrollView.contentSize = CGSize(width: 320, height: 480)
        scrollView.delegate = self
        imageView.image = image
        self.view.backgroundColor = UIColor(white: 0, alpha: 1)
        doneButton.alpha = 1
        actionsBar.alpha = 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressButton(_ sender: UIButton) {
        self.doneButton.isHidden = true
        self.actionsBar.isHidden = true
        dismiss(animated: true, completion: nil)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        UIView.animate(withDuration: 0.3) { () -> Void in
            self.doneButton.alpha = 0
            self.actionsBar.alpha = 0
            self.view.backgroundColor = UIColor(white: 0, alpha: 0)
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let scrollOffset = scrollView.contentOffset.y
        
        if scrollOffset < -100 {
            dismiss(animated: true, completion: nil)
        } else {
            
            UIView.animate(withDuration: 0.3) { () -> Void in
                self.doneButton.alpha = 1
                self.actionsBar.alpha = 1
                self.view.backgroundColor = UIColor(white: 0, alpha: 1)
            }
        }
    }
    
}
