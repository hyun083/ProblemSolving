import Foundation

let (A,B,C,D) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0],$0[1],$0[2],$0[3])}[0]
print(abs((A+D)-(B+C)))