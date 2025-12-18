import Foundation

let KN = readLine()!.split(separator: " ").map{Int($0)!}

let K = KN[0]
let N = KN[1]
if N > 1{
    var X = K+1
    while (X-K)*N < X{
        X += 1
    }
    print(X)
}else{
    print(-1)
}