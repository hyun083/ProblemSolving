import Foundation

let nk = readLine()!.split(separator: " ").map{Int($0)!}
let n = nk[0]
let k = nk[1]

var map = Array(repeating: Int.max, count: 100001)
var ans = -1

func bfs(){
    var q = [n]
    var dq = [Int]()
    while !q.isEmpty{
        dq = q.reversed()
        q.removeAll()
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            let time = map[curr]
            let next = [curr+1,curr-1,curr*2]
            
            for i in 0..<3{
                if next[i]<0 || next[i]>100000 { continue }
                if i == 2{
                    if map[next[i]] > time{
                        map[next[i]] = time
                        q.append(next[i])
                    }
                }else if map[next[i]] > time+1{
                    map[next[i]] = time+1
                    q.append(next[i])
                }
            }
        }
    }
}
map[n] = 0
bfs()
print(map[k])