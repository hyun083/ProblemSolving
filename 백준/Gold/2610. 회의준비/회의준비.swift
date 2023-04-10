import Foundation

let INF = Int.max
let n = Int(readLine()!)!
let m = Int(readLine()!)!
var arr = Array(repeating: -1, count: n)
var info = [(a:Int,b:Int)]()
var map = Array(repeating: Array(repeating: INF, count: n), count: n)

func root(of a:Int)->Int{
    if arr[a]<0 { return a }
    arr[a] = root(of: arr[a])
    return arr[a]
}

func union(a:Int, b:Int){
    let rootA = root(of: a)
    let rootB = root(of: b)
    if rootA == rootB {return}
    if arr[rootA] <= arr[rootB]{
        arr[rootB] = rootA
    }else{
        arr[rootA] = rootB
    }
}

for _ in 0..<m{
    let line = readLine()!.split(separator: " ").map{Int($0)!-1}
    let u = line[0]
    let v = line[1]
    union(a: u, b: v)
    map[u][v] = 1
    map[v][u] = 1
}

for p in 0..<n{
    for i in 0..<n{
        for k in 0..<n{
            if i==k{continue}
            if map[i][p]==INF || map[p][k]==INF{continue}
            map[i][k] = min(map[i][k], map[i][p]+map[p][k])
        }
    }
}

func dist(from a:Int) -> Int{
    var visited = Array(repeating: false, count: n)
    var q = [a]
    var idx = 0
    var myMin = INF
    var ans = a
    visited[a] = true
    while idx<q.count{
        let curr = q[idx]
        var time = 0
        for i in 0..<n{
            if map[curr][i]==INF{continue}
            time = max(time, map[curr][i])
            if !visited[i]{
                visited[i] = true
                q.append(i)
            }
        }
        if myMin>time{
            myMin = time
            ans = curr
        }
        idx += 1
    }
    return ans+1
}
var ans = [Int]()
var cnt = 0
for i in 0..<n{
    if arr[i] < 0{
        cnt += 1
        ans.append(dist(from: i))
    }
}
print(cnt)
for ans in ans.sorted(by: <){
    print(ans)
}