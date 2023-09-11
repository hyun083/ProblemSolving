import Foundation

let N = Int(readLine()!)!
var num = [Int]()
var arr = Array(repeating: [Int](), count: N)
var visited = Array(repeating: false, count: N)
var ans = Set<Int>()

for u in 0..<N{
    let v = Int(readLine()!)!-1
    arr[u].append(v)
}

func dfs(root:Int, curr:Int, path:Set<Int>){
    for next in arr[curr]{
        if !visited[next]{
            visited[next] = true
            var newPath = path
            newPath.insert(next)
            dfs(root: root, curr: next, path: newPath)
        }else if next == root{
            for node in path{ ans.insert(node) }
            return
        }
    }
}

for i in 0..<N{
    visited = Array(repeating: false, count: N)
    visited[i] = true
    dfs(root: i, curr: i, path: [i])
}
print(ans.count)
for node in ans.sorted(by: <){
    print(node+1)
}