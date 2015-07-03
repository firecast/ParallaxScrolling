//
//  ViewController.swift
//  ParallaxScrolling
//
//  Created by Amit Prabhu on 02/07/15.
//  Copyright (c) 2015 Value Edge. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Load the test views
        var colors = [UIColor .redColor(), UIColor .blackColor(), UIColor .yellowColor(), UIColor .redColor(), UIColor .purpleColor(), UIColor .blueColor()]
        var frameWidth : CGFloat = self.view.frame.size.width
        for i in 0...5 {
            let viewX = CGFloat(i) * frameWidth
            var view = UIView(frame: CGRect(x: viewX, y: 0, width: 400, height: 800))
            view.backgroundColor = colors[i]
            self.scrollView.addSubview(view)
        }
        scrollView.contentSize = CGSizeMake(frameWidth*6, self.view.frame.size.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

