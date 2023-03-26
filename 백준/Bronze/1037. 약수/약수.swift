let N = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map(){Int(String($0))!}.sorted(by: <)
print(numbers.first! * numbers.last!)
