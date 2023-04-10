import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]

var map = Array(repeating: [Int](), count: n)
var arr = Array(repeating: 0, count: n)
var ans = Array(repeating: 1, count: n)

for _ in 0..<m{
    let info = readLine()!.split(separator: " ").map{Int($0)!-1}
    let u = info[0]
    let v = info[1]
    map[u].append(v)
    arr[v] += 1
}

var q = [Int]()
var idx = 0
var semester = 2

for i in 0..<n{
    if arr[i]==0{ q.append(i) }
}

while !q.isEmpty{
    var tmp = q
    q.removeAll()
    
    for _ in 0..<tmp.count{
        let curr = tmp.removeLast()
        
        for next in map[curr]{
            arr[next] -= 1
            if arr[next] == 0{
                q.append(next)
                ans[next] = semester
            }
        }
    }
    semester += 1
}

for ans in ans{
    print(ans, terminator: " ")
}