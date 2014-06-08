//
//  Created by Pete Callaway on 08/06/2014.
//  Copyright (c) 2014 Dative Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let blurEffectStyle = UIBlurEffectStyle.Light

    @lazy var blurView :UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: self.blurEffectStyle)
        let view = UIVisualEffectView(effect: blurEffect)
        view.frame = self.view.bounds

        return view
    }()

    @lazy var vibrancyView :UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: self.blurEffectStyle)
        let vibrancy = UIVibrancyEffect(forBlurEffect: blurEffect)
        let view = UIVisualEffectView(effect: vibrancy)
        view.frame = self.view.bounds

        return view
    }()

    @lazy var vibrantLabel :UILabel = {
        let label = UILabel(frame: self.view.bounds)
        label.text = "Hello World"
        label.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        label.textAlignment = .Center

        switch self.blurEffectStyle {
        case .Dark:
            label.textColor = UIColor(white: 0.6, alpha: 1.0)

        case .Light, .ExtraLight:
            label.textColor = UIColor(white: 0.4, alpha: 1.0)
        }

        return label
    }()


    @IBAction func didTapTest(sender : AnyObject) {
        // Add the blur views to the hierarchy if they're not already there
        if !blurView.superview {
            view.addSubview(blurView)
            blurView.contentView.addSubview(vibrancyView)
            vibrancyView.contentView.addSubview(vibrantLabel)
        }

        // Animate the blurred view from off the bottom of the main view
        blurView.frame.origin.y = blurView.frame.size.height
        UIView.animateWithDuration(0.3, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: .AllowUserInteraction, animations: {
            self.blurView.frame.origin.y = 0
        }, completion: nil)

        // Animate the blurred view off the main view after a delay
        UIView.animateWithDuration(0.3, delay: 1.8, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: .AllowUserInteraction, animations: {
            self.blurView.frame.origin.y = self.blurView.frame.size.height
        }, completion: nil)
    }
}

