//
//  DebouncedObservedObject.swift
//  
//
//  Created by Anton Sarudko on 24.02.23.
//

import Combine
import Foundation

@propertyWrapper
public class DebouncedObservedObject<Wrapped: ObservableObject>: ObservableObject {
    public let wrappedValue: Wrapped
    private var subscription: AnyCancellable?
    
    public init(wrappedValue: Wrapped, delay: Double = 1) {
        self.wrappedValue = wrappedValue
        self.subscription = wrappedValue
            .objectWillChange
            .debounce(for: .seconds(delay), scheduler: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }
    }
}
