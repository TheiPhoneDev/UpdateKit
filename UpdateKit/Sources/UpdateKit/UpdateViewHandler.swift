//
//  UpdateViewHandler.swift
//  UpdateKit
//
//  Created by Pietro Gambatesa on 10/9/24.
//

import SwiftUI

public struct UpdateViewHandler: View {
    
    public var updateNotes: [UpdateNotes] = []
    @StateObject var typography = Typography()
    @StateObject var updatePresenter = UpdatePresenter()
    @Environment(\.presentationMode) var presentationMode
    
    public init(updateNotes: [UpdateNotes] = []) {
            self.updateNotes = updateNotes
    }
    
    public var body: some View {
        NavigationView(content: {
            ZStack {
                VStack {
                    ScrollView(.vertical, showsIndicators: false, content: {
                        VStack(spacing: 15) {
                            ForEach(updateNotes) { note in
                                VStack {
                                    HStack(spacing: 20) {
                                        if note.updateNoteImageType == "Image" {
                                            Image(note.updateNoteImage)
                                                .frame(width: typography.imageWidth, height: typography.imageHeight)
                                        } else if note.updateNoteImageType == "Symbol" {
                                            Image(systemName: note.updateNoteImage)
                                                .font(typography.sfSymbolFontType)
                                                .foregroundColor(Color(uiColor: typography.imageColor))
                                            
                                        } else if note.updateNoteImageType == "Text" {
                                            Text(note.updateNoteImage)
                                                .font(typography.sfSymbolFontType)
                                        }
                                        VStack(alignment: .leading) {
                                            Text(note.updateNoteTitle)
                                                .font(typography.textTitleFontType)
                                            Text(note.updateNoteDescription)
                                                .font(typography.textDescriptionFontType)
                                                .foregroundColor(typography.textDescriptionFontColor)
                                            
                                        }
                                    }.padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }

                            }
                        }

                    })
                    #if os(iOS)
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                        self.updatePresenter.isPresentable = false
                    } label: {
                        Text("Continue")
                            .font(.title3.weight(.medium))
                            .padding(.leading,60)
                            .padding(.trailing,60)
                            .padding(.bottom,10)
                            .padding(.top,10)
                    }.buttonStyle(.borderedProminent)
                        .tint(Color(uiColor: typography.buttonColor))
                    #endif
                    #if os(visionOS)
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                        self.updatePresenter.isPresentable = false
                    } label: {
                        Text("Continue")
                            .font(.title3.weight(.medium))
                            .padding(.leading,60)
                            .padding(.trailing,60)
                            .padding(.bottom,10)
                            .padding(.top,10)
                    }.buttonStyle(.borderedProminent)
                        .padding(.bottom,20)
                    #endif
                    
                }
            }.toolbar(content: {
                ToolbarItem(placement: .principal, content: {
                    Text("What's new")
                        .font(.title3.weight(.semibold))
                        .frame(maxWidth: .infinity, alignment: .center)
                })
            })
        }).navigationViewStyle(.stack)
    }
}

public class Typography: ObservableObject {
    @Published public var sfSymbolFontType: Font = .title.weight(.semibold)
    @Published public var textTitleFontType: Font = .title2.weight(.semibold)
    @Published public var textDescriptionFontType: Font = .subheadline
    @Published public var textDescriptionFontColor: Color = .secondary
    @Published public var buttonColor: UIColor = .systemBlue
    @Published public var imageColor: UIColor = .systemGray
    @Published public var imageWidth: CGFloat = 100
    @Published public var imageHeight: CGFloat = 100

    public init() {}

}

public class UpdatePresenter: ObservableObject {
    @AppStorage("isPresentable") public var isPresentable: Bool = true
    public init() {}

}



#Preview {
    UpdateViewHandler(updateNotes: notes)
}

