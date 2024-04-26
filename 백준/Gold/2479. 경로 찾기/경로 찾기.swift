import Foundation

let (N,K) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var map = Array(repeating: [Int](), count: N)
var code = [[Int]]()
var visited = Array(repeating: false, count: N)
var ans = [Int]()

for _ in 0..<N{
    let line = readLine()!.map{Int(String($0))!}
    code.append(line)
}
let (U,V) = [readLine()!.split(separator: " ").map{Int($0)!-1}].map{($0[0], $0[1])}[0]

func dfs(from curr:Int, pre:[Int]){
    var pre = pre
    
    if curr == V{
        ans = ans.isEmpty ? pre:ans.count > pre.count ? pre:ans
        return
    }
    
    for next in map[curr]{
        if !visited[next]{
            visited[next] = true
            dfs(from: next, pre: pre+[next])
        }
    }
}

func dist(a:[Int], b:[Int]) -> Int{
    var res = 0
    
    for i in 0..<K{
        res += a[i]==b[i] ? 0:1
    }
    return res
}

for i in 0..<N{
    for k in i+1..<N{
        if dist(a: code[i], b: code[k])==1{
            map[i].append(k)
            map[k].append(i)
        }
    }
}

dfs(from: U, pre: [U])

if ans.isEmpty{
    print(-1)
}else{
    for node in ans{
        print(node+1, terminator: " ")
    }
}