import Foundation

let N = Int(readLine()!)!
var arr = [(l:Int, r:Int)]()
var ans = Array(repeating: 1, count: N)

for _ in 0..<N{
    let (u,v) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
    arr.append((u,v))
}
arr.sort(by: {$0.l < $1.l})

for i in 0..<N{
    for k in 0..<i{
        if arr[k].r < arr[i].r{
            ans[i] = max(ans[i], ans[k]+1)
        }
    }
}

print(N-ans.max()!)