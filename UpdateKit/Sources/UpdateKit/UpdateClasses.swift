//
//  UpdateClasses.swift
//  UpdateKit
//
//  Created by Pietro Gambatesa on 11/1/24.
//

import Foundation
import SwiftUI



public class Typography: ObservableObject {
    @Published public var sfSymbolFontType: Font = .title.weight(.semibold)
    @Published public var textTitleFontType: Font = .title2.weight(.semibold)
    @Published public var textDescriptionFontType: Font = .subheadline
    @Published public var textDescriptionFontColor: Color = .secondary
    @Published public var buttonColor: UIColor = .systemBlue
    @Published public var imageColor: UIColor = .systemGray
    @Published public var imageWidth: CGFloat = 40
    @Published public var imageHeight: CGFloat = 40

    public init() {}

}

public class UpdatePresenter: ObservableObject {
    @AppStorage("isPresentable") public var isPresentable: Bool = true
    public init() {}

    @MainActor
    public func setTransparentNavBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()

        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    @MainActor
    public func resetNavBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
}


