import Foundation

let K = Double(readLine()!)!
var commision = 25.00 + K/100
commision = commision<100.00 ? 100.00:
            commision>2000.00 ? 2000.00: commision
print(String(format: "%.2f", commision))