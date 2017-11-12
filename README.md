# HARParser

[![Build Status](https://travis-ci.org/JanGorman/HARParser.svg?branch=master)](https://travis-ci.org/JanGorman/HARParser)
[![SPM](https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat)](https://swift.org/package-manager)

A parser for [.har](https://en.wikipedia.org/wiki/.har) files. To use it in you project add the dependency to your `Package.swift` file:

```swift
import PackageDescription

let package = Package(
    name: "My awesome CLI tool"
    dependencies: [
        .package(
            url: "https://github.com/JanGorman/HARParser",
            from: "1.0.0"
        )
    ]
)
```

## Usage

Initialise an instance of the parser with the contents of a .har file as [Data](https://developer.apple.com/documentation/foundation/data):

```swift
import HARParser

func parse() throws {
  let data = Data() // Load the file into memory
  let parser = HARParser(data: data)
  // After parsing you can access the different fields of the archive
  let har = try parser.parse()
}
```

## Licence

Table is released under the MIT license. See LICENSE for details.