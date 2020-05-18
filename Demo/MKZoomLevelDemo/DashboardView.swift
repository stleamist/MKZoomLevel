//
//  DashboardView.swift
//  MKZoomLevelDemo
//
//  Created by 김동규 on 2020/05/18.
//  Copyright © 2020 Stleam. All rights reserved.
//

import SwiftUI

struct DashboardView: View {
    
    class ZoomLevels: ObservableObject {
        @Published var system: CGFloat = 0
        @Published var computed: CGFloat = 0
    }
    
    @ObservedObject var zoomLevels = ZoomLevels()
    var onValueChanged: ((CGFloat) -> Void)?
    
    var body: some View {
        HStack(spacing: 12) {
            VStack(alignment: .trailing) {
                Group {
                    Text("_zoomLevel")
                    Spacer()
                    Text("MKZoomLevel")
                }
                .font(.system(.headline, design: .monospaced))
            }
            VStack(alignment: .leading, spacing: 8) {
                Group {
                    Text(numberFormatter.string(for: zoomLevels.system) ?? "")
                        .alignmentGuide(.leading) { $0[.leading] - 12 }
                    Spacer()
                    TextField("value", value: $zoomLevels.computed, formatter: numberFormatter) {
                        self.onValueChanged?(self.zoomLevels.computed)
                    }
                        .keyboardType(.numbersAndPunctuation)
                        .padding(.leading, 12)
                        .background(
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .fill(Color(.label).opacity(0.2))
                                .frame(height: 36)
                        )
                }
                .font(.system(.body, design: .monospaced))
            }
        }
        .padding(32)
        .frame(height: 128)
        .frame(maxWidth: .infinity)
        .foregroundColor(Color(.label))
    }
    
    var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 4
        return formatter
    }()
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .background(Color(.systemBlue))
            .environment(\.colorScheme, .dark)
            .previewLayout(.fixed(width: 375, height: 128))
    }
}
