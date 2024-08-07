//
//  InstallationView.swift
//  CompressXOnboarding
//
//  Created by Dinh Quang Hieu on 7/8/24.
//

import SwiftUI

struct InstallationView: View {

  @Binding var currentStep: OnboardingStep

  var body: some View {
    VStack(spacing: 16) {
      Spacer(minLength: 0)
      Text("Here's a photo of my cat")
      Image(nsImage: NSImage(named: "IMG_8574")!)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: 300, height: 220)
        .clipped()
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
      Button {
        withAnimation(.spring(duration: 1)) {
          currentStep = .license
        }
      } label: {
        Text("Next")
      }
      .buttonStyle(NiceButtonStyle())
      Spacer(minLength: 0)
    }
  }
}

#Preview {
  InstallationView(currentStep: .constant(.installation))
    .frame(width: 600, height: 341, alignment: .center)
}
