//
//  GridExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 11.04.2024.
//

import SwiftUI

struct GridExample: View {
    var body: some View {
        Grid(alignment: .center, horizontalSpacing: 8, verticalSpacing: 8) {
            ForEach(0..<4) { rowIndex in
                GridRow(alignment: .bottom) {
                    ForEach(0..<4) { columnIndex in
                        let cellNumber = (rowIndex * 4) + (columnIndex + 1)

                        if cellNumber == 7 {
                            EmptyView()
//                            Color.green
//                                .gridCellUnsizedAxes([.horizontal, .vertical])
                        } else {
                            cell(int: cellNumber)
                                .gridCellColumns(cellNumber == 6 ? 2 : 1)
                                .gridCellAnchor(.trailing)
                                .gridColumnAlignment(
                                    cellNumber == 1 ? .trailing :
                                    cellNumber == 4 ? .leading : .center
                                )
                        }

                    }
                }
            }
        }
    }

    private var initExample: some View {
        Grid() {
            GridRow {
                cell(int: 1)
                cell(int: 2)
                cell(int: 3)
            }

            Divider()
                .gridCellUnsizedAxes(.horizontal)
            cell(int: 9999)


            GridRow {
                cell(int: 4)
                cell(int: 5)
            }
        }
    }

    private func cell(int: Int) -> some View {
        Text("\(int)")
            .font(.largeTitle)
            .padding()
            .background(Color.blue)
            .frame(height: int == 10 ? 20 : nil)
    }
}

#Preview {
    GridExample()
}
