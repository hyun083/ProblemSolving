import Foundation

let arr = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: <)
let A = arr[0]
let B = arr[1]
let C = arr[2]

if A==B && B==C{
    print(2)
}else if C*C == A*A + B*B{
    print(1)
}else{
    print(0)
}