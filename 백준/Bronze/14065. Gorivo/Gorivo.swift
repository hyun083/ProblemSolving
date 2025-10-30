import Foundation

let X = Double(readLine()!)!
let meter = X*1609.344
let temp = 100000/meter
print(temp*3.785411784)