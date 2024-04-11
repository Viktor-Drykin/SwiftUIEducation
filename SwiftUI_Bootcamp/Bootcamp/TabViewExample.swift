//
//  TabViewExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 30.01.2024.
//

import SwiftUI

struct TabViewExample: View {

    @State var selectionTab = 2

    let icons: [String] = [
        "heart.fill",
        "globe",
        "house.fill",
        "person.fill"
    ]

    var body: some View {
        example2
    }

    var example2: some View {
        TabView {
            ForEach(icons, id: \.self) { icon in
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .padding(30)

            }
        }
        .background(
            RadialGradient(gradient: Gradient(colors: [Color.red, Color.blue]), center: .center, startRadius: 5, endRadius: 300)
        )
        .frame(height: 300)
        .tabViewStyle(PageTabViewStyle())
    }

    var example1: some View {
        TabView(selection: $selectionTab) {
            HomeView(selectedTab: $selectionTab)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)

            Text("Browse tab")
                .tabItem {
                    Image(systemName: "globe")
                    Text("Browse")
                }
                .tag(1)

            Text("Profile tab")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(2)
        }
        .tint(.red)

    }
}

struct HomeView: View {

    @Binding var selectedTab: Int

    var body: some View {
        ZStack {
            Color.red
            VStack {
                Text("Home Tab")
                    .font(.largeTitle)
                    .foregroundStyle(.white)

                Button {
                    selectedTab = 2
                } label: {
                    Text("Go to profile")
                        .font(.headline)
                        .padding()
                        .padding(.horizontal)
                        .background(Color.white)
                }
            }

        }
    }
}

#Preview {
    TabViewExample()
}
