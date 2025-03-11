//
//  BlockableNumber.swift
//  Runner
//
//  Created by Jongseo Won on 3/11/25.
//


import Foundation

struct BlockableNumber: Codable, Comparable {
    let number: Int64
    let modificationDate: Date
    let isRemoved: Bool

    // MARK: - Comparable
    static func < (lhs: BlockableNumber, rhs: BlockableNumber) -> Bool {
        return lhs.number < rhs.number
    }
}
