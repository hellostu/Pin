//
//  Pin.swift
//  studomonly
//
//  Pin is an interface into AutoLayout that is simpler than using NSLayoutConstraints, and
//  more readable. It uses the Builder Model to construct a Pin object. Calling the constrain()
//  method constructs the NSLayoutConstraint and adds the constraints to the parent view.
//
//  https://github.com/studomonly/Pin

import UIKit

public class Pin {
    
    private let rootView:UIView
    private var toView:UIView?
    private var superView:UIView?
    private var rootViewAttribute:NSLayoutAttribute?
    private var toViewAttribute:NSLayoutAttribute?
    private var constant:CGFloat = 0.0
    private var multiplier:CGFloat = 1.0
    private var priority:UILayoutPriority = 1000
    private var relation:NSLayoutRelation = .Equal
    private var constraint:NSLayoutConstraint?
    
    //////////////////////////////////////////////////////////////////////////
    //MARK: -
    //MARK: Lifecycle
    //////////////////////////////////////////////////////////////////////////
    
    public init(view:UIView) {
        self.rootView = view
    }
    
    //////////////////////////////////////////////////////////////////////////
    //MARK: -
    //MARK: Public Methods
    //////////////////////////////////////////////////////////////////////////
    
    public func to(view:UIView) -> Pin {
        self.toView = view
        self.relation = .Equal
        return self
    }
    
    public func height(multiplyBy value:CGFloat = 1.0, add constant:CGFloat = 0.0) -> Pin {
        setAttribute(.Height)
        return multiplyBy(value).add(constant)
    }
    
    public func height(height:CGFloat) -> Pin {
        setAttribute(.Height)
        self.constant = height
        self.multiplier = 0.0
        return self
    }
    
    public func width(multiplyBy value:CGFloat = 1.0, add constant:CGFloat = 0.0) -> Pin {
        setAttribute(.Width)
        return multiplyBy(value).add(constant)
    }
    
    public func width(width:CGFloat) -> Pin {
        setAttribute(.Width)
        self.constant = width
        self.multiplier = 0.0
        return self
    }
    
    public func left(multiplyBy value:CGFloat = 1.0, add constant:CGFloat = 0.0) -> Pin {
        setAttribute(.Left)
        return multiplyBy(value).add(constant)
    }
    
    public func right(multiplyBy value:CGFloat = 1.0, add constant:CGFloat = 0.0) -> Pin {
        setAttribute(.Right)
        return multiplyBy(value).add(constant)
    }
    
    public func top(multiplyBy value:CGFloat = 1.0, add constant:CGFloat = 0.0) -> Pin {
        setAttribute(.Top)
        return multiplyBy(value).add(constant)
    }
    
    public func bottom(multiplyBy value:CGFloat = 1.0, add constant:CGFloat = 0.0) -> Pin {
        setAttribute(.Bottom)
        return multiplyBy(value).add(constant)
    }
    
    public func centerX(multiplyBy value:CGFloat = 1.0, add constant:CGFloat = 0.0) -> Pin {
        setAttribute(.CenterX)
        return multiplyBy(value).add(constant)
    }
    
    public func centerY(multiplyBy value:CGFloat = 1.0, add constant:CGFloat = 0.0) -> Pin {
        setAttribute(.CenterY)
        return multiplyBy(value).add(constant)
    }
    
    public func baseline(multiplyBy value:CGFloat = 1.0, add constant:CGFloat = 0.0) -> Pin {
        setAttribute(.Baseline)
        return multiplyBy(value).add(constant)
    }
    
    public func leading(multiplyBy value:CGFloat = 1.0, add constant:CGFloat = 0.0) -> Pin {
        setAttribute(.Leading)
        return multiplyBy(value).add(constant)
    }
    
    public func trailing(multiplyBy value:CGFloat = 1.0, add constant:CGFloat = 0.0) -> Pin {
        setAttribute(.Trailing)
        return multiplyBy(value).add(constant)
    }
    
    internal func add(add:CGFloat) -> Pin {
        self.constant = add
        return self
    }
    
    internal func multiplyBy(multiplier:CGFloat) -> Pin {
        self.multiplier = multiplier
        return self
    }
    
    public func priority(priority:UILayoutPriority) -> Pin {
        self.priority = priority
        return self
    }
    
    public func relation(relation:NSLayoutRelation) -> Pin {
        self.relation = relation
        return self
    }
    
    public func constrain() -> Pin {
        if self.superView == nil {
            self.superView = rootView.superview
        }
        return self.constrainOn(self.superView!)
    }
    
    public func constrainOn(parent:UIView) -> Pin {
        if self.toView == nil {
            self.toView = self.superView
        }
        if self.rootViewAttribute == nil {
            self.rootViewAttribute = self.toViewAttribute
        } else if self.toViewAttribute == nil {
            self.toViewAttribute = self.rootViewAttribute
        }
        
        self.rootView.translatesAutoresizingMaskIntoConstraints = false
        let constraint = NSLayoutConstraint(item: self.rootView, attribute: rootViewAttribute!, relatedBy: relation, toItem: toView, attribute: toViewAttribute!, multiplier: multiplier, constant: constant)
        constraint.priority = self.priority
        parent.addConstraint(constraint)
        self.constraint = constraint
        return self
    }
    
    public func get() -> NSLayoutConstraint? {
        return constraint
    }
    
    //////////////////////////////////////////////////////////////////////////
    //MARK: -
    //MARK: Private Methods
    //////////////////////////////////////////////////////////////////////////
    
    private func setAttribute(attribute:NSLayoutAttribute) {
        if let _ = self.rootViewAttribute {
            self.toViewAttribute = attribute
        } else {
            self.rootViewAttribute = attribute
        }
    }
    
    
    
    
}
