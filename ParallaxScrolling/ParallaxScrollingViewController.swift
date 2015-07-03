//
//  ParallaxScrollingViewController.swift
//  ParallaxScrolling
//
//  Created by Amit Prabhu on 03/07/15.
//  Copyright (c) 2015 Value Edge. All rights reserved.
//

import UIKit

class ParallaxScrollingViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var topScrollView: UIScrollView!
    @IBOutlet weak var bottomScrollView: UIScrollView!
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var imageView: UIImageView!
     let ZOOMPOINT = 50
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var frameWidth = self.view.frame.size.width
        var frameHeight = self.view.frame.size.height
        self.bottomScrollView.contentSize = CGSizeMake(frameWidth, 818+200)
        self.imageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView == self.bottomScrollView {
            var detailY = self.bottomScrollView.bounds.origin.y
            var factor = 0.5
            var parallaxlY = self.bottomScrollView.bounds.origin.y * CGFloat(factor)
            
            if detailY < 0 {
                var zoomScale = (abs(detailY) + CGFloat(ZOOMPOINT))/100 + 1
                println(zoomScale)
                self.topScrollView.setZoomScale(zoomScale, animated: false)
            }
            else {
                self.topScrollView.setContentOffset(CGPointMake(0, parallaxlY), animated: false)
            }
        }
        
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        if scrollView == self.topScrollView {
            return self.imageView
        }
        return nil
    }
    
    func scrollViewDidEndZooming(scrollView: UIScrollView, withView view: UIView!, atScale scale: CGFloat) {
        
    }

}
