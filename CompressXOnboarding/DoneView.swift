//
//  DoneView.swift
//  CompressXOnboarding
//
//  Created by Dinh Quang Hieu on 7/8/24.
//

import SwiftUI

struct DoneView: View {

  @Binding var currentStep: OnboardingStep

  var body: some View {
    VStack(spacing: 16) {
      Spacer(minLength: 0)
      Text("Here's the last photo of my cat")
      Image(nsImage: NSImage(named: "cat3")!)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: 300, height: 220)
        .clipped()
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
      Button {
        withAnimation(.spring(duration: 1)) {
          currentStep = .start
        }
      } label: {
        Text("Done")
      }
      .buttonStyle(NiceButtonStyle())
      Spacer(minLength: 0)
    }
  }
}
