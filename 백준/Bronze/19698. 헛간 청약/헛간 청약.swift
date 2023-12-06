import Foundation

let (N,W,H,L) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2], $0[3])}[0]
let ans = min(N, (W/L)*(H/L))
print(ans)