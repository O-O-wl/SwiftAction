# SwiftAction
![build](https://img.shields.io/badge/swift-4.0-orange) ![pod](https://img.shields.io/badge/pod-v0.1.0-yellow) ![build](https://img.shields.io/badge/build-passing-dgreen) ![platform](https://img.shields.io/badge/platform-iOS-blue) ![license](https://img.shields.io/badge/license-MIT-black)


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Installation

SwiftAction is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SwiftAction'
```

## Usage

- **addAction**
```swift
       button.addAction(for: .touchDown) {
           $0.backgroundColor = .red
       }
       
       button.addAction(for: .touchUpInside) {
           $0.backgroundColor = .blue
       }
       
       button.addAction(for: .touchDragInside, action: buttonDragInside)
   }
```
- **removeAction**
```swift
   deinit {
       UIControl.Event.all.forEach {
           self.button.removeAction(for: $0)
       }
   }
```

## Author

O-O-wl, o.o.wl.soft@gmail.com

## License

SwiftAction is available under the MIT license. See the LICENSE file for more info.
