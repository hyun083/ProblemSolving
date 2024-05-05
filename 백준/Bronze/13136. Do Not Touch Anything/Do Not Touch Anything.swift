import Foundation

let (R,C,N) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]
var ans = R%N==0 ? R/N:(R/N)+1
ans *= C%N==0 ? C/N:(C/N)+1
print(ans)
