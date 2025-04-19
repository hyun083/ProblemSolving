let N = Int(readLine()!)!

var year = 2024
var month = 8

let total = (N - 1) * 7
month += total

while month > 12 {
    month -= 12
    year += 1
}

print("\(year) \(month)")