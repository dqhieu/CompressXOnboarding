//
//  ContentView.swift
//  CompressXOnboarding
//
//  Created by Dinh Quang Hieu on 7/8/24.
//

import SwiftUI

struct ContentView: View {
  @State private var currentStep: OnboardingStep = .start
  @State private var allSteps: [OnboardingStep] = [
    .start,
    .installation,
    .license,
    .done
  ]

  @State private var stepOpacity = 0.0

  var body: some View {
    VStack(spacing: 0) {
      switch currentStep {
      case .start:
        StartView(allSteps: $allSteps, currentStep: $currentStep)
          .transition(
            .asymmetric(
              insertion: .move(edge: .trailing).combined(with: .opacity),
              removal: .move(edge: .leading).combined(with: .opacity)
            )
          )
      case .installation:
        InstallationView(currentStep: $currentStep)
          .transition(
            .asymmetric(
              insertion: .move(edge: .trailing).combined(with: .opacity),
              removal: .move(edge: .leading).combined(with: .opacity)
            )
          )
      case .license:
        LicenseView(currentStep: $currentStep)
          .transition(
            .asymmetric(
              insertion: .move(edge: .trailing).combined(with: .opacity),
              removal: .move(edge: .leading).combined(with: .opacity)
            )
          )
      case .done:
        DoneView(currentStep: $currentStep)
          .transition(
            .asymmetric(
              insertion: .move(edge: .trailing).combined(with: .opacity),
              removal: .move(edge: .leading).combined(with: .opacity)
            )
          )
      }
      Spacer(minLength: 0)
      Divider()
        .opacity(stepOpacity)
      VStack(spacing: 0) {
        Spacer()
        HStack(spacing: 8) {
          Spacer()
          ForEach(0..<allSteps.count, id: \.self) { index in
            OnboardingStepView(allSteps: allSteps, index: index, currentStep: $currentStep)
            if index < allSteps.count - 1 {
              Text("→")
            }
          }
          Spacer()
        }
        Spacer()
      }
      .background(.thinMaterial)
      .frame(height: 59)
      .opacity(stepOpacity)
    }
    .background(VisualEffectView().ignoresSafeArea())
    .frame(width: 600, height: 400, alignment: .center)
    .fontDesign(.rounded)
    .task {
      try? await Task.sleep(nanoseconds: 1_000_000_000)
      withAnimation(.spring(duration: 2)) {
        stepOpacity = 1.0
      }
    }
  }
}

#Preview {
    ContentView()
}
