import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0]
let m = nm[1]
var line = readLine()!.split(separator: " ").map{Int(String($0))!-1}
var arr = Array(repeating: [Int](), count: n)
var ans = Array(repeating: 0, count: n)

for i in 1..<n{
    arr[line[i]].append(i)
}

func dfs(from u:Int){
    for next in arr[u]{
        ans[next] += ans[u]
        dfs(from: next)
    }
}

for _ in 0..<m{
    let iw = readLine()!.split(separator: " ").map{Int(String($0))!}
    let i = iw[0]-1
    let w = iw[1]
    ans[i] += w
}
dfs(from: 0)
for a in ans{
    print(a, terminator: " ")
}