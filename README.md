# RunOnce

한 번만 실행되도록 보장하는 코드

## Requirements

- Xcode 13.2.1
- Swift 5.5

## Installation

### Swift Package Manager

```swift
.package(url: "https://github.com/jaemyeong/RunOnce.git", .upToNextMajor(from: "0.1.0"))
```

## Usage

```swift
import RunOnce

let onceToken = RunOnceToken()

onceToken {
    ...
}
```

## License

- [MIT](LICENSE)

## Author

[Jaemyeong Jin](https://github.com/jaemyeong) ([jaemyeong@me.com](mailto:jaemyeong@me.com))
