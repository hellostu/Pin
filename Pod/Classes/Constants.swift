//
//  Constants.swift
//  Pods
//
//  Created by Stuart Lynch on 21/12/2015.
//
//

import UIKit

extension Pin {

    public func left(add constant:CGFloat) -> Pin {
        return left().add(constant)
    }
    
    public func right(add constant:CGFloat) -> Pin {
        return right().add(constant)
    }
    
    public func top(add constant:CGFloat) -> Pin {
        return top().add(constant)
    }
    
    public func bottom(add constant:CGFloat) -> Pin {
        return bottom().add(constant)
    }
    
    public func centerX(add constant:CGFloat) -> Pin {
        return centerX().add(constant)
    }
    
    public func centerY(add constant:CGFloat) -> Pin {
        return centerY().add(constant)
    }
    
    public func width(add constant:CGFloat) -> Pin {
        return width().add(constant)
    }
    
    public func height(add constant:CGFloat) -> Pin {
        return height().add(constant)
    }
    
}
