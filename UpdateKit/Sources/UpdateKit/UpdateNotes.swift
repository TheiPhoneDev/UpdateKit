//
//  UpdateNotes.swift
//  UpdateKit
//
//  Created by Pietro Gambatesa on 10/9/24.
//

import SwiftUI



public struct UpdateNotes: Identifiable, Sendable {
    public var id = UUID()
    public var updateNoteTitle: String
    public var updateNoteDescription: String
    public var updateNoteImageType: String
    public var updateNoteImage: String
    
    public init(updateNoteImageType: String, updateNoteImage: String, updateNoteTitle: String, updateNoteDescription: String) {
            self.updateNoteImageType = updateNoteImageType
            self.updateNoteImage = updateNoteImage
            self.updateNoteTitle = updateNoteTitle
            self.updateNoteDescription = updateNoteDescription
    }
}


public let notes: [UpdateNotes] = [
    .init(updateNoteImageType: "Symbol", updateNoteImage: "sparkles", updateNoteTitle: "New features ✨", updateNoteDescription: "New features are available for you to use."),
    .init(updateNoteImageType: "Text", updateNoteImage: "🎨", updateNoteTitle: "New app icons 📱", updateNoteDescription: "New app icons are available for you to use."),
    .init(updateNoteImageType: "Symbol", updateNoteImage: "ant.circle.fill", updateNoteTitle: "Bug fixes", updateNoteDescription: "Bug fixes to make the app even faster"),
    .init(updateNoteImageType: "Text", updateNoteImage: "🌈", updateNoteTitle: "UI improvements 🌈", updateNoteDescription: "UI improvements to make the app even faster and deliver a better experience"),
]



