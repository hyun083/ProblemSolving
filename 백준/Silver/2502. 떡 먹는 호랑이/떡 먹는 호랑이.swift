import Foundation

let DK = readLine()!.split(separator: " ").map{Int($0)!}
let D = DK[0]
let K = DK[1]

var A = Array(repeating: 0, count:31)
var B = Array(repeating: 0, count:31)

A[1] = 1
B[1] = 0

A[2] = 0
B[2] = 1

for i in 3..<31{
    A[i] = A[i-1] + A[i-2]
    B[i] = B[i-1] + B[i-2]
}

let countOfA = A[D]
let countOgB = B[D]

for i in 1..<K+1{
    let tmp = countOfA * i
    if (K-tmp)%B[D] == 0{
        print(i)
        print((K-tmp)/B[D])
        break
    }
}