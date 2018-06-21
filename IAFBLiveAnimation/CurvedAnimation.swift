//
//  CurvedAnimation.swift
//  IAFBLiveAnimation
//
//  Created by iSlam AbdelAziz on 6/21/18.
//  Copyright © 2018 IA. All rights reserved.
//

import UIKit

public class CurvedAnimation: NSObject {
    
    public init(mainView: UIView, presentedImage: UIImage){
        super.init()
        generateAnimatedViews(parentView: mainView, image: presentedImage)
    }

    func customPath() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 200))
        let endPoint = CGPoint(x: 400, y: 200)
        
        let randomYShift = 200 + drand48() * 300
        let cp1 = CGPoint(x: 100, y: 100 - randomYShift)
        let cp2 = CGPoint(x: 200, y: 300 + randomYShift)
        
        path.addCurve(to: endPoint, controlPoint1: cp1, controlPoint2: cp2)
        return path
    }
    
    
    func generateAnimatedViews(parentView: UIView, image: UIImage){
        
        let imageView = UIImageView(image: image)
        let dimention = 20 + drand48() * 10
        imageView.frame = CGRect(x: 0, y: 0, width: dimention, height: dimention)
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = customPath().cgPath
        animation.duration = 2 + drand48() * 3
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        imageView.layer.add(animation, forKey: nil)
        
        parentView.addSubview(imageView)
    }

    
}
