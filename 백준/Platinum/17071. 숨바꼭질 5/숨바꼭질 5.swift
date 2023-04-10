import Foundation

let nk = readLine()!.split(separator: " ").map{Int($0)!}
let n = nk[0]
var k = nk[1]
var ans = -1

var map = Array(repeating: Array(repeating: false, count: 2), count: 500001)
map[n][0] = true
var time = 0

func bfs(){
    var q = [n]
    var dq = [Int]()
    while !q.isEmpty{
        k += time
        dq = q.reversed()
        q.removeAll()
        if k<0 || k>500000{return}
        if map[k][time%2]{
            ans = time
            return
        }
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            let next = [curr-1,curr+1,curr*2]
            
            for next in next{
                if next<0 || next>=500001{continue}
                if !map[next][(time+1)%2]{
                    map[next][(time+1)%2] = true
                    q.append(next)
                }
            }
        }
        time += 1
    }
}
bfs()
print(ans)