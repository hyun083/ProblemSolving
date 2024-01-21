import Foundation

let (N,K) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
let res = K*(K+1)/2
print(N<res ? -1:(N-res)%K == 0 ? K-1:K)