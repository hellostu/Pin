//
//  ViewController.swift
//  Pin
//
//  Test View Controller that shows how we can use the 'Pin' framework to simplify
//  AutoLayout constraints and make them more readable. 
//

import UIKit
import Pin

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftView = UIView()
        leftView.backgroundColor = UIColor.green
        self.view.addSubview(leftView)
        Pin(view: leftView).left().constrain()
        Pin(view: leftView).top(add: 20).constrain()
        Pin(view: leftView).bottom().constrain()
        //Width of 300 hundred ideally, but don't grow bigger than half the screen
        Pin(view: leftView).width(multiplyBy: 0.5).relation(.lessThanOrEqual).constrain()
        Pin(view: leftView).width(300).priority(750).constrain()
        
        let rightTopView = UIView()
        rightTopView.backgroundColor = UIColor.blue
        self.view.addSubview(rightTopView)
        Pin(view: rightTopView).left().to(leftView).right().constrain()
        Pin(view: rightTopView).top().to(leftView).top().constrain()
        Pin(view: rightTopView).height(100).constrain()
        Pin(view: rightTopView).right().constrain()
        
        let topSeperatorView = UIView()
        self.view.addSubview(topSeperatorView)
        Pin(view: topSeperatorView).top().to(rightTopView).bottom().constrain()
        Pin(view: topSeperatorView).left().to(leftView).right().constrain()
        Pin(view: topSeperatorView).right().constrain()
        
        let yellowSquare = UIView()
        yellowSquare.backgroundColor = UIColor.yellow
        self.view.addSubview(yellowSquare)
        Pin(view: yellowSquare).top().to(topSeperatorView).bottom().constrain()
        Pin(view: yellowSquare).height(50).constrain()
        Pin(view: yellowSquare).width().to(yellowSquare).height().constrain()
        Pin(view: yellowSquare).left(add: 10).to(topSeperatorView).constrain()
        
        let middleSeperatorView = UIView()
        self.view.addSubview(middleSeperatorView)
        Pin(view: middleSeperatorView).top().to(yellowSquare).bottom().constrain()
        Pin(view: middleSeperatorView).left().to(topSeperatorView).constrain()
        Pin(view: middleSeperatorView).right().constrain()
        Pin(view: middleSeperatorView).height().to(topSeperatorView).constrain()
        
        let purpleSquare = UIView()
        purpleSquare.backgroundColor = UIColor.purple
        self.view.addSubview(purpleSquare)
        Pin(view: purpleSquare).top().to(middleSeperatorView).bottom().constrain()
        Pin(view: purpleSquare).right(add: -10).constrain()
        Pin(view: purpleSquare).width().to(yellowSquare).constrain()
        Pin(view: purpleSquare).height().to(yellowSquare).constrain()
        
        let bottomSeperatorView = UIView()
        self.view.addSubview(bottomSeperatorView)
        Pin(view: bottomSeperatorView).top().to(purpleSquare).bottom().constrain()
        Pin(view: bottomSeperatorView).left().to(topSeperatorView).constrain()
        Pin(view: bottomSeperatorView).right().constrain()
        Pin(view: bottomSeperatorView).height().to(topSeperatorView).constrain()
        Pin(view: bottomSeperatorView).bottom().constrain()
        
        let leftLabel = UILabel()
        leftLabel.text = "Left Box"
        leftLabel.textColor = UIColor.white
        leftView.addSubview(leftLabel)
        Pin(view: leftLabel).centerX().constrain()
        Pin(view: leftLabel).centerY().constrain()
        
        let rightLabel = UILabel()
        rightLabel.text = "Right Box"
        rightLabel.textColor = UIColor.white
        rightTopView.addSubview(rightLabel)
        Pin(view: rightLabel).centerX().constrain()
        Pin(view: rightLabel).centerY().constrain()
        
        let emptySpaceLabel1 = emptySpaceLabel()
        topSeperatorView.addSubview(emptySpaceLabel1)
        Pin(view: emptySpaceLabel1).centerX().constrain()
        Pin(view: emptySpaceLabel1).centerY().constrain()
        
        let emptySpaceLabel2 = emptySpaceLabel()
        middleSeperatorView.addSubview(emptySpaceLabel2)
        Pin(view: emptySpaceLabel2).centerX().constrain()
        Pin(view: emptySpaceLabel2).centerY().constrain()
        
        let emptySpaceLabel3 = emptySpaceLabel()
        bottomSeperatorView.addSubview(emptySpaceLabel3)
        Pin(view: emptySpaceLabel3).centerX().constrain()
        Pin(view: emptySpaceLabel3).centerY().constrain()
    }
    
    fileprivate func emptySpaceLabel() -> UILabel {
        let emptySpaceLabel = UILabel()
        emptySpaceLabel.textColor = UIColor.black
        emptySpaceLabel.text = "Empty Space"
        return emptySpaceLabel
    }

}

