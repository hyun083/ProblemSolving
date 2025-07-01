import Foundation

let NK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NK[0]
let K = NK[1]

var arr = readLine()!.split(separator: " ").map{Int($0)!}
var cnt = 0
var ans = [Int]()

for last in stride(from: N-1, through: 1, by: -1){
    for i in 0...last-1{
        if arr[i] > arr[i+1]{
            arr.swapAt(i, i+1)
            cnt += 1
            if cnt == K{
                ans = [arr[i],arr[i+1]]
            }
        }
    }
}
if ans.isEmpty{
    print(-1)
}else{
    print(ans[0],ans[1])
}