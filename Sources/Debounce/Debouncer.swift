//
//  Debouncer.swift
//  
//
//  Created by Anton Sarudko on 24.02.23.
//

import Combine
import Foundation

public class Debouncer<T>: ObservableObject {
    
    // MARK: - Properties
    @Published public var input: T
    @Published public private(set) var output: T
    private var debounce: AnyCancellable?
    
    public init(initialValue: T, delay: Double = 1) {
        self.input = initialValue
        self.output = initialValue
        self.debounce = $input
            .debounce(for: .seconds(delay), scheduler: DispatchQueue.main)
            .sink { [weak self] in
                self?.output = $0
            }
    }
}
