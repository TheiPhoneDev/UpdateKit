//
//  UpdateViewHandler2.swift
//  UpdateKit
//
//  Created by Pietro Gambatesa on 11/1/24.
//

import SwiftUI

public struct UpdateViewHandler2: View {
    
    public var viewNotes: [UpdateNotesWithView] = []
    @StateObject var typography = Typography()
    @StateObject var updatePresenter = UpdatePresenter()
    @Environment(\.presentationMode) var presentationMode
    
    public init(viewNotes: [UpdateNotesWithView] = []) {
            self.viewNotes = viewNotes
    }
    
    public var body: some View {
        NavigationView(content: {
            ZStack {
                VStack {
                    ScrollView(.vertical, showsIndicators: false, content: {
                        VStack(spacing: 15) {
                            ForEach(viewNotes) { note in
                                VStack {
                                    HStack(spacing: 20) {
                                        if note.updateNoteImageType == "Image" {
                                            Image(note.updateNoteImage)
                                                .resizable()
                                                .frame(width: typography.imageWidth, height: typography.imageHeight)
                                                .cornerRadius(10)
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
                                            if note.hasConnectedView == true {
                                                NavigationLink {
                                                    note.updateView
                                                } label: {
                                                    Text("See more")
                                                }.frame(maxWidth: .infinity, alignment: .trailing)
                                            }
                                        }
                                    }.padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.trailing, 20)
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
                        .padding(.bottom,10)
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



#Preview {
    UpdateViewHandler2(viewNotes: viewnotes)
}
