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
