//
//  VibrationFeedback.swift
//  test
//
//  Created by Lydia Ostos on 7/22/25.
//

import Foundation
enum VibrationFeedbackMode: String, CaseIterable, Identifiable {
case off, on
    var id: String { rawValue }
}
