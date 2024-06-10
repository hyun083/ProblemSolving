import Foundation

let (H,W,X,Y) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2], $0[3])}[0]
var B = [[Int]]()

for _ in 0..<H+X{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    B.append(line)
}

for i in X..<H+X{
    for k in Y..<W+Y{
        B[i][k] -= B[i-X][k-Y]
    }
}

for i in 0..<H{
    for k in 0..<W{
        print(B[i][k],terminator: " ")
    }
    print()
}