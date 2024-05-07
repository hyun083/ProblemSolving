import Foundation

let (A,B) = [readLine()!.split(separator: " ").map{Double($0)!}].map{($0[0],$0[1])}[0]
let M:Double = (B-A)/400
print(1/(pow(10, M)+1))