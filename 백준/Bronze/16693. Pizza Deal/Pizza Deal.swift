import Foundation

let AP = readLine()!.split(separator: " ").map{Double($0)!}
let A = AP[0]
let price1 = AP[1]
let RP = readLine()!.split(separator: " ").map{Double($0)!}
let R = RP[0]
let price2 = RP[1]

let res1 = A/price1
let res2 = Double.pi*R*R/price2
print(res1 > res2 ? "Slice of pizza":"Whole pizza")