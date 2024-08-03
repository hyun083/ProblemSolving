import Foundation

let (N,K) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var arr = readLine()!.split(separator: " ").map{Int($0)!}
var left = 0
var right = 0
var ans = 1

while left<N{
    if right==N{
        left += 1
    }else{
        right += 1
    }
    if right<N && arr[right] == arr[right-1]{
        left = right
    }else if right<N{
        ans = max(ans, right-left+1)
    }
}
print(ans)