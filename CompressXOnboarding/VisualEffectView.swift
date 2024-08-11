//
//  VisualEffectView.swift
//  CompressX
//
//  Created by Dinh Quang Hieu on 6/8/24.
//

import SwiftUI

struct VisualEffectView: NSViewRepresentable {
  func makeNSView(context: Context) -> NSVisualEffectView {
    let view = NSVisualEffectView()

    view.blendingMode = .behindWindow
    view.state = .active
    view.material = .menu

    return view
  }

  func updateNSView(_ nsView: NSVisualEffectView, context: Context) {
    //
  }
}
