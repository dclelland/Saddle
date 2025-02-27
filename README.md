# Saddle

Hardware-accelerated vector calculus library for Swift.

## Installation

### Swift Package Manager

Simply add Saddle to your `Package.swift` file: 

```swift
let package = Package(
    name: "Example",
    dependencies: [
        .package(url: "https://github.com/dclelland/Saddle.git", from: "0.1.0"),
    ],
    targets: [
        .target(name: "Example", dependencies: ["Saddle"])
    ]
)
```

Then import Saddle into your Swift files:

```swift
import Saddle
```

## Links

### Dependencies

- [apple/swift-numerics](https://github.com/apple/swift-numerics)
- [dclelland/Plinth](https://github.com/dclelland/Plinth)

## Todo

- [ ] Reinstantiate matrix validation
- [ ] Consider adding relevant Accelerate wrappers
- [ ] Consider adding helpers from `Linear Algebra` and `Transformations` modules
- [ ] Consider adding helpers from `Image Processing` module
- [ ] Consider adding ramp masks; radius (`hypot`) and phase (`atan2`) masks
- [ ] Write `Matrix2` and `Matrix2x2` wrapper functions
- [ ] Write `Matrix2x2` functors
- [ ] Write `Matrix3`, `Matrix3x3` structs
- [ ] Write documentation

# Documentation

Work in progress...
