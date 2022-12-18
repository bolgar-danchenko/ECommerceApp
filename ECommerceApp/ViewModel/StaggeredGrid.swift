//
//  StaggeredGrid.swift
//  ECommerceApp
//
//  Created by Konstantin Bolgar-Danchenko on 15.12.2022.
//

import SwiftUI

// T -> is to hold the identifiable collection of data
struct StaggeredGrid<Content: View, T: Identifiable>: View where T: Hashable {
    
    // Returns each object from collection to build View
    var content: (T) -> Content
    
    var list: [T]
    
    // Columns
    var columns: Int
    
    // Properties
    var showsIndicators: Bool
    var spacing: CGFloat
    
    init(columns: Int, showsIndicators: Bool = false, spacing: CGFloat = 10, list: [T], @ViewBuilder content: @escaping (T) -> Content) {
        self.content = content
        self.list = list
        self.spacing = spacing
        self.showsIndicators = showsIndicators
        self.columns = columns
    }
    
    // Staggered grid function
    func setUpList() -> [[T]] {
        // Creating empty sub arrays of columns count
        var gridArray: [[T]] = Array(repeating: [], count: columns)
        
        // Spliting array for VStack oriented View
        var currentIndex: Int = 0
        
        for object in list {
            gridArray[currentIndex].append(object)
            
            // Increasing index count and resetting if overbounds the columns count
            if currentIndex == (columns - 1) {
                currentIndex = 0
            } else {
                currentIndex += 1
            }
        }
        
        return gridArray
    }
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 20) {
            
            ForEach(setUpList(), id: \.self) { columnsData in
                // For optimized using LazyStack
                LazyVStack(spacing: spacing) {
                    
                    ForEach(columnsData) { object in
                        content(object)
                    }
                }
                .padding(.top, getIndex(values: columnsData) == 1 ? 80 : 0)
            }
        }
        .padding(.vertical)
    }
    
    // Moving second row down
    func getIndex(values: [T]) -> Int {
        let index = setUpList().firstIndex { t in
            return t == values
        } ?? 0
        
        return index
    }
}

struct StaggeredGrid_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
