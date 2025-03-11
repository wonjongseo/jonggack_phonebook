//
//  IdentifiableNumber.swift
//  Runner
//
//  Created by Jongseo Won on 3/11/25.
//


import Foundation

struct IdentifiableNumber: Codable, Comparable {
    let number: Int64
    let label: String
    let modificationDate: Date
    let isRemoved: Bool

    // MARK: - Comparable
    static func < (lhs: IdentifiableNumber, rhs: IdentifiableNumber) -> Bool {
        return lhs.number < rhs.number
    }
}
