## Setup

- In Xcode select File > Add Packages.
- Enter this project's URL: [https://github.com/rrt5n/debounce](https://github.com/rrt5n/debounce)

## SwiftUI Usage
### Create Debouncer
Debouncer is perfect for debouncing value types.
```Swift
struct ContentView: View {
    
    @StateObject private var value = Debouncer(initialValue: 0.0, delay: 0.5)
    
    var body: some View {
        VStack {
            Slider(value: $value.input, in: 0...100)
            Text("Real \(value.input)")
            Text("Debounced \(value.output)")
        }
        .padding()
    }
}
 ```
### Create DebouncedObservedObject
DebouncedObservedObject is perfect for debouncing reference types.
```Swift
class Counter: ObservableObject {
    @Published private(set) var value = 0
    
    func add() {
        value += 1
    }
}

struct ContentView: View {
    
    @StateObject @DebouncedObservedObject private var debouncedCounter = Counter()
    
    var body: some View {
        VStack {
            Text("Debounced \(debouncedCounter.value)")
            Button("Add", action: debouncedCounter.add)
        }
        .padding()
    }
}
 ```

[MIT](https://choosealicense.com/licenses/mit/)
