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


public struct UpdateNotesWithView: Identifiable, Sendable {
    public var id = UUID()
    public var updateNoteTitle: String
    public var updateNoteDescription: String
    public var updateNoteImageType: String
    public var updateNoteImage: String
    public var updateView: AnySendableView
    public var hasConnectedView: Bool = false
    
    public init(updateNoteImageType: String, updateNoteImage: String, updateNoteTitle: String, updateNoteDescription: String, updateView: AnySendableView, hasConnectedView: Bool) {
            self.updateNoteImageType = updateNoteImageType
            self.updateNoteImage = updateNoteImage
            self.updateNoteTitle = updateNoteTitle
            self.updateNoteDescription = updateNoteDescription
            self.updateView = updateView
            self.hasConnectedView = hasConnectedView
    }
}

@MainActor
public let viewnotes: [UpdateNotesWithView] = [
    .init(updateNoteImageType: "Symbol", updateNoteImage: "sparkles", updateNoteTitle: "New features ✨", updateNoteDescription: "New features are available for you to use.", updateView: AnySendableView(TestView1()), hasConnectedView: true),
    .init(updateNoteImageType: "Text", updateNoteImage: "🎨", updateNoteTitle: "New app icons 📱", updateNoteDescription: "New app icons are available for you to use.", updateView: AnySendableView(TestView2()), hasConnectedView: true),
    .init(updateNoteImageType: "Symbol", updateNoteImage: "ant.circle.fill", updateNoteTitle: "Bug fixes", updateNoteDescription: "Bug fixes to make the app even faster", updateView: AnySendableView(TestView3()), hasConnectedView: true),
    .init(updateNoteImageType: "Text", updateNoteImage: "🌈", updateNoteTitle: "UI improvements 🌈", updateNoteDescription: "UI improvements to make the app even faster and deliver a better experience", updateView: AnySendableView(TestView1()), hasConnectedView: false),
]


//Wrapper to use View with the Sendable type
public struct AnySendableView: View, Sendable {
    private let viewBuilder: () -> AnyView

    // Initialize with any View
    public init<V: View & Sendable>(_ view: V) {
        self.viewBuilder = { AnyView(view) }
    }

    // Conforming to View
    public var body: some View {
        viewBuilder()
    }
}

