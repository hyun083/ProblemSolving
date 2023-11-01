import Foundation

let (A,B,C) = [readLine()!.split(separator: " ").map{Double($0)!}].map{($0[0], $0[1], $0[2])}[0]
print(max(Int(A*B/C), Int(A/B*C)))