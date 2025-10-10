import Foundation

let line = readLine()!.split(separator: " ").map{Int($0)!}
let N = line[0]
let A = line[1]
let B = line[2]
let C = line[3]
let D = line[4]

let X = N%A==0 ? N/A*B : (N/A+1)*B
let Y = N%C==0 ? N/C*D : (N/C+1)*D
print(min(X,Y))