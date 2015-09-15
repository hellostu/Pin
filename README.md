# Pin

[![CI Status](http://img.shields.io/travis/Stuart Lynch/Pin.svg?style=flat)](https://travis-ci.org/Stuart Lynch/Pin)
[![Version](https://img.shields.io/cocoapods/v/Pin.svg?style=flat)](http://cocoapods.org/pods/Pin)
[![License](https://img.shields.io/cocoapods/l/Pin.svg?style=flat)](http://cocoapods.org/pods/Pin)
[![Platform](https://img.shields.io/cocoapods/p/Pin.svg?style=flat)](http://cocoapods.org/pods/Pin)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

Pin was designed to simplify AutoLayout code. It is intended to be easier to read than
NSLayoutConstraint code. Here is some typical AutoLayout code which matches
a view's width to it's parent's width:

```Swift
let view = UIView()
self.addSubview(view)
view.translatesAutoresizingMaskIntoConstraints = false
let constraint = NSLayoutConstraint(item: view, attribute: .Width, relatedBy: .Equal, toItem: self, attribute: .Width, multiplier: 1.0, constant: 0.0)
view.addConstraint(constraint)
```

Here is the same example with Pin:

```Swift
let view = UIView()
self.addSubview(view)
Pin(view: view).width().constrain()
```

Notice that 'view.translatesAutoresizingMaskIntoConstraints = false' is not required with Pin.
All Pin constaints must terminate with a call to the constrain() function. Pin is so simple because it makes assumptions that are true for the majority of layout constraints you
are likely to set. These are as follows:

1. You are applying the constraint on the view's superview.
2. The attribute you are setting, you want to match on both views (i.e. view's width == superview width)
3. You are using an equality relation
4. The multiplier = 1.0 and the constant = 0.0

If these assumptions aren't true, you can still set the additional properties using Pin. 

#Relating to Other Views

If you want the top of one view to equal the bottom of another view:

```Swift
let otherView = UIView()
self.addSubview(otherView)
...


let view = UIView()
self.addSubview(view)
Pin(view: view).top().to(otherView).bottom().constrain()
```

You can read this constraint as Pin -> view.top -> to -> otherView.bottom. 

### Multipliers and Constants

If you want to set a multiplier and a constant you can do that with the following:

```Swift
Pin(view: view).width().multiplier(0.5).constant(10.0).constrain()
```

This will constrain the width to be half the parent's width + 10pts.

### Width and Height Fixed Constraints

Setting width and height using only NSLayoutConstraints is particularly verbose. 
Using pin you can do the following:

```Swift
Pin(view: view).width(50.0).constrain()
Pin(view: view).height(100.0).constrain()
```

### Change Relation

Pin assumes that the constraint relation is NSLayoutRelation.Equal. However if you
want to set a different relation, you can use the relation(...) function:

```Swift
Pin(view: view).width().multiplier(0.5).relation(.LessThanOrEqual).constrain()
```

### Constraint Priority

Constraint priority is a property on NSLayoutConstraint and cannot be set from
the init function. This adds additional code lines. It's simple with Pin:

```Swift
Pin(view: view).width().multiplier(0.5).relation(.LessThanOrEqual).constrain()
Pin(view: view).width(200.0).priority(750).constrain()
```

This constraint will set the width of view to be 200, only if it's width would
be less than half of it's parent. 

## Installation

Pin is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Pin"
```

## Author

Stuart Lynch, stu@iname.com

## License

Pin is available under the MIT license. See the LICENSE file for more info.
