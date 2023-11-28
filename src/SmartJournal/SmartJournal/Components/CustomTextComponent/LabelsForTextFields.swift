//
//  LabelsForTextFields.swift
//  SmartJournal
//
//  Created by Usman Tahir Qureshi on 11/15/23.
//

import SwiftUI

struct LabelsForTextFields: View {
    
    var labelText: String
    
    var body: some View {
        Text(labelText)
            .font(.caption)
            .foregroundColor(.gray)
            .padding(.leading, 8)
            .padding(.top)
    }
}

#Preview {
    LabelsForTextFields(labelText: "Sample")
}
