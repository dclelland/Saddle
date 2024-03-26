# Saddle

Hardware-accelerated vector calculus library for Swift.

## Installation

### Swift Package Manager

Simply add Plinth to your `Package.swift` file: 

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

- [ ] Refactor matrix validation
- [ ] Write documentation

# Documentation

Work in progress...

# Notes

```
Matrix2<Scalar> (perhaps swap ComplexMatrix out for this in certain cases)
Matrix2x2<Scalar>
Matrix3<Scalar>
Matrix3x3<Scalar>

might be a good place to integrate the ramp
magnitude -> hypot
phase -> atan2

should this support rgba as well as xyz etc?
yeah perhaps these should have image implementations...?
complex matrix image should have the lightness around the right way; just invert it first

- arithmetic
- wrappers
- functors
- dot and cross products
```
