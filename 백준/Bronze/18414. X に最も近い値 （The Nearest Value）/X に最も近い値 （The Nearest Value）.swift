import Foundation

let XLR = readLine()!.split(separator: " ").map{Int($0)!}
let X = XLR[0]
let L = XLR[1]
let R = XLR[2]

if X < L{
    print(L)
}else if R < X{
    print(R)
}else{
    print(X)
}