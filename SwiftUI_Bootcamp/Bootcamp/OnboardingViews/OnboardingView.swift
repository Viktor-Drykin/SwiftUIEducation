//
//  OnboardingView.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 10.02.2024.
//

import SwiftUI

struct OnboardingView: View {

    // Onboarding states:
    /*
     0 - Welcome screen
     1 - Add name
     2 - Add age
     3 - Add gender
     */
    @State var onboardingState: Int = 0
    let transition: AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))

    @State var name = ""
    @State var age: Double = 50
    @State var gender: String = ""
    @State var alertTitle = ""
    @State var showAlert = false

    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false

    var body: some View {
        ZStack {
            ZStack {
                switch onboardingState {
                case 0:
                    welcomeSection
                        .transition(transition)
                case 1:
                    addNameSection
                        .transition(transition)
                case 2:
                    addAgeSection
                        .transition(transition)
                case 3:
                    addGenderSection
                        .transition(transition)
                default:
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundStyle(Color.green)
                }
            }

            // buttons
            VStack {
                Spacer()
                bottomButton
            }
            .padding(30)
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertTitle))
        }
    }
}

#Preview {
    OnboardingView()
        .background(Color.purple)
}

// MARK: Components

extension OnboardingView {

    private var bottomButton: some View {
        Text(onboardingState == 0 ? "SIGN UP" :
                onboardingState == 3 ? "FINISH" : "NEXT")
            .foregroundStyle(Color.purple)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .onTapGesture {
                handleNextButtonPressed()
            }
    }

    private var welcomeSection: some View {
        VStack(spacing: 40) {
            Spacer()
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundStyle(.white)
            Text("Find your match.")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .overlay(alignment: .bottom, content: {
                    Capsule(style: .continuous)
                        .frame(height: 3)
                        .offset(y: 5)
                        .foregroundStyle(.white)
                })
            Text("This is the #1 app for finding your match online! In this app we are practicing using AppStorage and other SwiftUI techniques.")
                .fontWeight(.medium)
                .foregroundStyle(.white)
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(30)
    }

    private var addNameSection: some View {
        VStack(spacing: 40) {
            Spacer()
            Text("What's your name?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            TextField("Your name here...", text: $name)
                .font(.headline)
                .frame(height: 55)
                .padding(.horizontal)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Spacer()
            Spacer()
        }
        .padding(30)
    }

    private var addAgeSection: some View {
        VStack(spacing: 40) {
            Spacer()
            Text("What's your age?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            Text(String(format: "%.0f", age))
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(Color.white)
            Slider(value: $age, in: 18...100, step: 1)
                .tint(Color.white)
            Spacer()
            Spacer()
        }
        .padding(30)
    }

    private var addGenderSection: some View {
        VStack(spacing: 40) {
            Spacer()
            Text("What's your gender?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)

            Picker(selection: $gender,
                   label:
                    Text(gender.count > 1 ? gender : "Select a gender")
                .font(.headline)
                .foregroundStyle(.purple)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                   ,
                   content: {
                Text("Male").tag("Male")
                Text("Female").tag("Female")
                Text("Non-Binary").tag("Non-Binary")
            })
            .pickerStyle(MenuPickerStyle())

            Spacer()
            Spacer()
        }
        .padding(30)
    }
}

// MARK: functions

extension OnboardingView {

    func handleNextButtonPressed() {

        switch onboardingState {
        case 1:
            guard name.count >= 3 else {
                showAlert(title: "Your name should be at least 3 characters long")
                return
            }
        case 3:
            if gender.isEmpty {
                showAlert(title: "You must select gender")
                return
            }
        default:
            break
        }


        if onboardingState == 3 {
            signIn()
        } else {
            withAnimation(.spring()) {
                onboardingState += 1
            }
        }
    }

    func showAlert(title: String) {
        alertTitle = title
        showAlert.toggle()
    }

    func signIn() {
        currentUserName = name
        currentUserAge = Int(age)
        currentUserGender = gender
        withAnimation(.spring()) {
            currentUserSignedIn = true
        }
    }

}
