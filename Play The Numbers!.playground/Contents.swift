//create random numbers
var numbers = [Int]()

for _ in Range(1...10) {
    numbers.append(Int.random(in: Range(1...100)))
}

// add highest and lowest onto dictionary

let dict: Dictionary<String, Int> = ["high": numbers.max() ?? 0, "low": numbers.min() ?? 0]

// retrieve from dictionary and print

print(dict["high"] ?? "error")
print(dict["low"] ?? "error")
