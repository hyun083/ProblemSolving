import Foundation

let A1 = Int(readLine()!)!
let A2 = Int(readLine()!)!
let A3 = Int(readLine()!)!

let firstFloor = A2*2 + A3*4
let secondFloor = A1*2 + A3*2
let thirdFloor = A1*4 + A2*2
print(min(firstFloor, secondFloor, thirdFloor))