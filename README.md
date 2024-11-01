#  UpdateKit
A simple and lightweight Swift library to better present release notes in iOS, iPadOS and visionOS apps.

![Swift](https://img.shields.io/badge/Swift-6.0-orange?logo=swift)
![iOS](https://img.shields.io/badge/iOS-15.0-blue?logo=apple)
![iPadOS](https://img.shields.io/badge/iPadOS-15.0-blue?logo=apple)
![visionOS](https://img.shields.io/badge/visionOS-1.0-blue?logo=apple)



## Requirements
**UpdateKit** requires iOS 15.0 and visionOS 1.0

## What is update kit ?

**UpdateKit** is a simple and lightweight Swift library that simplifies update screens. As a developer I find myself to have to write release notes, and sometime I don't show it in the best way possible to the users. One-time update screen are the best way to show our users the new version's changes and let them know what's new and what's been fixed.

## UpdateKit structure
**UpdateKit** is inspired to Apple update screens, which can be seen in iOS built-in apps. I wanted to create a simple structure that is flexible and also customizable and can be suited to the developer's needs.

## Features ✨
- Customizable cells
- Native UI
- Integration with iOS, iPadOS and visionOS
- Attach Views to show what changes have been made
- Thread-safe (this means no data race) by using the Sendable protocol
  

## Usage
To use UpdateKit, first of all:
```swift
  import UpdateKit
```
  in your project. You can implement it as SPM (Swift Package Manager).
- Go to the UpdateNotes.swift file and edit the updateNotes collection. That's where the release notes are collected.
- Call the UpdateViewHandler view wherever you need it.

## Implementation
```swift
UpdateViewHandler(updateNotes: notes)
```

## Screenshots

<img src="https://github.com/user-attachments/assets/24a7aa13-1d4e-4b98-a15c-55caa3798186" height="500"/>

## Demo 1
https://github.com/user-attachments/assets/e6bee750-fa39-4261-96d2-f767abf7bd62

## Demo 2
https://github.com/user-attachments/assets/f6d3ccf5-e8ee-41dc-b0d2-04dcba1206ec




