//
//  UserDefault.swift
//  Runner
//
//  Created by Jongseo Won on 3/11/25.
//


import Foundation

fileprivate let userDefaults = UserDefaults(suiteName: "group.com.wonjongseo")

@propertyWrapper
struct UserDefault<T: Codable> {
    private let key: String
    private let defaultValue: T

    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            if let encodedValue = userDefaults?.object(forKey: key) as? Data,
               let decodedValue = decode(encodedValue) {
                return decodedValue
            }
            return defaultValue
        }
        set {
            if let encodedValue = encode(newValue) {
                userDefaults?.set(encodedValue, forKey: key)
            }
        }
    }

    private func encode(_ value: T) -> Data? {
        try? JSONEncoder().encode(value)
    }

    private func decode(_ data: Data) -> T? {
        try? JSONDecoder().decode(T.self, from: data)
    }
}

@propertyWrapper
struct NullableUserDefault<T> {
    private let key: String

    init(_ key: String) {
        self.key = key
    }

    var wrappedValue: T? {
        get { userDefaults?.object(forKey: key) as? T }
        set { userDefaults?.set(newValue, forKey: key) }
    }
}
