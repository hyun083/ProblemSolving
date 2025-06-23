import Foundation

let NMAB = readLine()!.split(separator: " ").map{Int($0)!}
let N = NMAB[0]
let M = NMAB[1]
let A = NMAB[2]
let B = NMAB[3]
var arr = [(L:Int,R:Int)]()

for _ in 0..<M{
    let LR = readLine()!.split(separator: " ").map{Int($0)!}
    let L = LR[0]
    let R = LR[1]
    arr.append((L,R))
}

var visited = Array(repeating: Int.max, count: 1000000)
var q = [(puppy:Int, cnt:Int)]()
var idx = 0
q.append((0,0))
visited[0] = 0

while idx < q.count{
    let dx = [A,B]
    let curr = q[idx]
    
    for nx in dx{
        let nextPuppy = curr.puppy + nx
        if nextPuppy > N { continue }
        
        var valid = true
        for range in arr{
            if range.L <= nextPuppy && nextPuppy <= range.R{
                valid = false
                break
            }
        }
        if !valid { continue }
        
        if visited[nextPuppy] > curr.cnt+1{
            visited[nextPuppy] = curr.cnt+1
            q.append((nextPuppy, curr.cnt+1))
        }
    }
    idx += 1
}
print(visited[N]==Int.max ? -1:visited[N])