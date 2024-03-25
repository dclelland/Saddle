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

- [ ] Write documentation

# Documentation

Work in progress...

# Notes

```
Perhaps this should be a separate lib to Plinth

Matrix2<Scalar> (perhaps swap ComplexMatrix out for this in certain cases)
Jacobian2<Scalar>
Matrix3<Scalar>
Jacobian3<Scalar>

might be a good place to integrate the ramp
magnitude -> hypot
phase -> atan2

should this support rgba as well as xyz etc?

jacobian - just do it on a torus and then crop it

Not Matrix2x2/Matrix3x3?
And not Matrix<SIMD3<Scalar>>? (this would lose you all the Accelerate functions)

perhaps do support SIMD2 etc structs via subscripts
add functors

yeah perhaps these should have image implementations...?

add 'crop' helper which just takes an int and pipes it to all
```
