//
//  Constants.swift
//  Pods
//
//  Created by Stuart Lynch on 21/12/2015.
//
//

import UIKit

extension Pin {

    //LEFT
    public func left(add constant:CGFloat) -> Pin {
        return left().add(constant)
    }
    
    public func left(multiplyBy value:CGFloat) -> Pin {
        return left().multiplyBy(value)
    }
    
    public func left(multiplyBy value:CGFloat, add constant:CGFloat) -> Pin {
        return left().multiplyBy(value).add(constant)
    }
    
    //RIGHT
    public func right(add constant:CGFloat) -> Pin {
        return right().add(constant)
    }
    
    public func right(multiplyBy value:CGFloat) -> Pin {
        return right().multiplyBy(value)
    }
    
    public func right(multiplyBy value:CGFloat, add constant:CGFloat) -> Pin {
        return right().multiplyBy(value).add(constant)
    }
    
    //TOP
    public func top(add constant:CGFloat) -> Pin {
        return top().add(constant)
    }
    
    public func top(multiplyBy value:CGFloat) -> Pin {
        return top().multiplyBy(value)
    }
    
    public func top(multiplyBy value:CGFloat, add constant:CGFloat) -> Pin {
        return top().multiplyBy(value).add(constant)
    }
    
    //BOTTOM
    public func bottom(add constant:CGFloat) -> Pin {
        return bottom().add(constant)
    }
    
    public func bottom(multiplyBy value:CGFloat) -> Pin {
        return bottom().multiplyBy(value)
    }
    
    public func bottom(multiplyBy value:CGFloat, add constant:CGFloat) -> Pin {
        return bottom().multiplyBy(value).add(constant)
    }
    
    //BASELINE
    public func baseline(add constant:CGFloat) -> Pin {
        return baseline().add(constant)
    }
    
    public func baseline(multiplyBy value:CGFloat) -> Pin {
        return baseline().multiplyBy(value)
    }
    
    public func baseline(multiplyBy value:CGFloat, add constant:CGFloat) -> Pin {
        return baseline().multiplyBy(value).add(constant)
    }
    
    //CENTERX
    public func centerX(add constant:CGFloat) -> Pin {
        return centerX().add(constant)
    }
    
    public func centerX(multiplyBy value:CGFloat) -> Pin {
        return centerX().multiplyBy(value)
    }
    
    public func centerX(multiplyBy value:CGFloat, add constant:CGFloat) -> Pin {
        return centerX().multiplyBy(value).add(constant)
    }
    
    //CENTERX
    public func centerY(add constant:CGFloat) -> Pin {
        return centerY().add(constant)
    }
    
    public func centerY(multiplyBy value:CGFloat) -> Pin {
        return centerY().multiplyBy(value)
    }
    
    public func centerY(multiplyBy value:CGFloat, add constant:CGFloat) -> Pin {
        return centerY().multiplyBy(value).add(constant)
    }
    
    //WIDTH
    public func width(add constant:CGFloat) -> Pin {
        return width().add(constant)
    }
    
    public func width(multiplyBy value:CGFloat) -> Pin {
        return width().multiplyBy(value)
    }
    
    public func width(multiplyBy value:CGFloat, add constant:CGFloat) -> Pin {
        return width().multiplyBy(value).add(constant)
    }
    
    //WIDTH
    public func height(add constant:CGFloat) -> Pin {
        return height().add(constant)
    }
    
    public func height(multiplyBy value:CGFloat) -> Pin {
        return height().multiplyBy(value)
    }
    
    public func height(multiplyBy value:CGFloat, add constant:CGFloat) -> Pin {
        return height().multiplyBy(value).add(constant)
    }
    
}
