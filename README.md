# MEDataLoader

[![CI Status](https://img.shields.io/travis/m7md3elwan/MEDataLoader.svg?style=flat)](https://travis-ci.org/m7md3elwan/MEDataLoader)
[![Version](https://img.shields.io/cocoapods/v/MEDataLoader.svg?style=flat)](https://cocoapods.org/pods/MEDataLoader)
[![License](https://img.shields.io/cocoapods/l/MEDataLoader.svg?style=flat)](https://cocoapods.org/pods/MEDataLoader)
[![Platform](https://img.shields.io/cocoapods/p/MEDataLoader.svg?style=flat)](https://cocoapods.org/pods/MEDataLoader)

MEDataLoader is an iOS library that allow loading & caching of data from a remote URL

## Description

MEDataLoader is an iOS library that allow loading & caching of data from a remote Url
It consists of 2 main components:
- MEDownloader: can load Data from a remote Url that don't duplicate multiple requests for the same Url, request can be cancelled without affecting other requests.
- MECache: caches Any object with a cache limit.

## Installation

MEDataLoader is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MEDataLoader'
```

## Author

m7md3elwan, eng.m.elwan@gmail.com

## License

MEDataLoader is available under the MIT license. See the LICENSE file for more info.
