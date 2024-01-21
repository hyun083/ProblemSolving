import Foundation

let (N,K) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
let res = K*(K+1)/2

if res > N{
    print(-1)
}else if res <= N{
    print((N-res)%K == 0 ? K-1:K)
}