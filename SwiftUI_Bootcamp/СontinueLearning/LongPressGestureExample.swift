//
//  LongPressGestureExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 19.06.2024.
//

import SwiftUI

struct LongPressGestureExample: View {

    @State var isComplete = false
    @State var isSuccess = false

    var body: some View {
        loadingExample
        //basicExample
    }

    private var loadingExample: some View {
        VStack {
            Rectangle()
                .fill(isSuccess ? Color.green : Color.blue)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray)

            HStack {
                Text("CLICK HERE")
                    .foregroundStyle(Color.white)
                    .padding()
                    .background(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .onLongPressGesture(minimumDuration: 1, maximumDistance: 50) {
                        // at the min duration
                        withAnimation(.easeInOut) {
                            isSuccess = true
                        }
                    } onPressingChanged: { isPressing in
                        // start of press -> min duration
                        print(">>> isPressing \(isPressing)")
                        if isPressing {
                            withAnimation(.easeInOut(duration: 1)) {
                                isComplete = true
                            }
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                if !isSuccess {
                                    withAnimation(.easeInOut) {
                                        isComplete = false
                                    }
                                }
                            }
                        }
                    }


                Text("RESET")
                    .foregroundStyle(Color.white)
                    .padding()
                    .background(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .onTapGesture {
                        isComplete = false
                        isSuccess = false
                    }
            }
        }
    }

    private var basicExample: some View {
        Text(isComplete ? "Completed" : "Not complete")
            .padding()
            .padding(.horizontal)
            .background(isComplete ? Color.green : Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .onLongPressGesture(minimumDuration: 2, maximumDistance: 100) {
                isComplete.toggle()
            }
    }
}

#Preview {
    LongPressGestureExample()
}
