//
//  Pin.swift
//  studomonly
//
//  Pin is an interface into AutoLayout that is simpler than using NSLayoutConstraints, and
//  more readable. It uses the Builder Model to construct a Pin object. Calling the constrain()
//  method constructs the NSLayoutConstraint and adds the constraints to the parent view.
//
//  https://github.com/hellostu/Pin

import UIKit

open class Pin {
    
    fileprivate let rootView:UIView
    fileprivate var toView:UIView?
    fileprivate var superView:UIView?
    fileprivate var rootViewAttribute:NSLayoutAttribute?
    fileprivate var toViewAttribute:NSLayoutAttribute?
    fileprivate var constant:CGFloat = 0.0
    fileprivate var multiplier:CGFloat = 1.0
    fileprivate var priority:UILayoutPriority = 1000
    fileprivate var relation:NSLayoutRelation = .equal
    fileprivate var constraint:NSLayoutConstraint?
    
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
    
    open func to(_ view:UIView) -> Pin {
        self.toView = view
        self.relation = .equal
        return self
    }
    
    open func height() -> Pin {
        setAttribute(.height)
        return self
    }
    
    open func height(_ height:CGFloat) -> Pin {
        setAttribute(.height)
        self.constant = height
        self.multiplier = 0.0
        return self
    }
    
    open func width() -> Pin {
        setAttribute(.width)
        return self
    }
    
    open func width(_ width:CGFloat) -> Pin {
        setAttribute(.width)
        self.constant = width
        self.multiplier = 0.0
        return self
    }
    
    open func left() -> Pin {
        setAttribute(.left)
        return self
    }
    
    open func right() -> Pin {
        setAttribute(.right)
        return self
    }
    
    open func top() -> Pin {
        setAttribute(.top)
        return self
    }
    
    open func bottom() -> Pin {
        setAttribute(.bottom)
        return self
    }
    
    open func baseline() -> Pin {
        setAttribute(.lastBaseline)
        return self
    }
    
    open func centerX() -> Pin {
        setAttribute(.centerX)
        return self
    }
    
    open func centerY() -> Pin {
        setAttribute(.centerY)
        return self
    }
    
    internal func add(_ add:CGFloat) -> Pin {
        self.constant = add
        return self
    }
    
    internal func multiplyBy(_ multiplier:CGFloat) -> Pin {
        self.multiplier = multiplier
        return self
    }
    
    open func priority(_ priority:UILayoutPriority) -> Pin {
        self.priority = priority
        return self
    }
    
    open func relation(_ relation:NSLayoutRelation) -> Pin {
        self.relation = relation
        return self
    }
    
    @discardableResult open func constrain() -> Pin {
        if self.superView == nil {
            self.superView = rootView.superview
        }
        return self.constrainOn(self.superView!)
    }
    
    @discardableResult open func constrainOn(_ parent:UIView) -> Pin {
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
    
    open func get() -> NSLayoutConstraint? {
        return constraint
    }
    
    //////////////////////////////////////////////////////////////////////////
    //MARK: -
    //MARK: Private Methods
    //////////////////////////////////////////////////////////////////////////
    
    fileprivate func setAttribute(_ attribute:NSLayoutAttribute) {
        if let _ = self.rootViewAttribute {
            self.toViewAttribute = attribute
        } else {
            self.rootViewAttribute = attribute
        }
    }
    
    
    
    
}
