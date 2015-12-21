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
    
    public func height() -> Pin {
        setAttribute(.Height)
        return self
    }
    
    public func height(height:CGFloat) -> Pin {
        setAttribute(.Height)
        self.constant = height
        self.multiplier = 0.0
        return self
    }
    
    public func width() -> Pin {
        setAttribute(.Width)
        return self
    }
    
    public func width(width:CGFloat) -> Pin {
        setAttribute(.Width)
        self.constant = width
        self.multiplier = 0.0
        return self
    }
    
    public func left() -> Pin {
        setAttribute(.Left)
        return self
    }
    
    public func left(left:CGFloat) -> Pin {
        setAttribute(.Left)
        self.constant = left
        return self
    }
    
    public func right() -> Pin {
        setAttribute(.Right)
        return self
    }
    
    public func right(right:CGFloat) -> Pin {
        setAttribute(.Right)
        self.constant = right
        return self
    }
    
    public func top() -> Pin {
        setAttribute(.Top)
        return self
    }
    
    public func top(top:CGFloat) -> Pin {
        setAttribute(.Top)
        self.constant = top
        return self
    }
    
    public func bottom() -> Pin {
        setAttribute(.Bottom)
        return self
    }
    
    public func bottom(bottom:CGFloat) -> Pin {
        setAttribute(.Bottom)
        self.constant = bottom
        return self
    }
    
    public func centerX() -> Pin {
        setAttribute(.CenterX)
        return self
    }
    
    public func centerX(centerX:CGFloat) -> Pin {
        setAttribute(.CenterX)
        self.constant = centerX
        return self
    }
    
    public func centerY() -> Pin {
        setAttribute(.CenterY)
        return self
    }
    
    public func centerY(centerY:CGFloat) -> Pin {
        setAttribute(.CenterY)
        self.constant = centerY
        return self
    }
    
    public func constant(constant:CGFloat) -> Pin {
        self.constant = constant
        return self
    }
    
    public func multiplier(multiplier:CGFloat) -> Pin {
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
        self.constrainOn(self.superView!)
        return self
    }
    
    public func constrainOn(parent:UIView) {
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
