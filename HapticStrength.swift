//
//  HapticStrength.swift
//  test
//
//  Created by Lydia Ostos on 7/22/25.
//

import Foundation
enum HapticStrength: String, CaseIterable, Identifiable {
    case low, medium, high
    var id: String { rawValue }
}
