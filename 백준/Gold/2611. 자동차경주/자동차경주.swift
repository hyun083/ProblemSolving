import Foundation

let N = Int(readLine()!)!
let M = Int(readLine()!)!

var arr = Array(repeating: [(num:Int, cost:Int)](), count: N)
var income = Array(repeating: 0, count: N)
var cost = Array(repeating: 0, count: N)

for _ in 0..<M{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    let p = line[0]-1
    let q = line[1]-1
    let r = line[2]
    arr[p].append((q,r))
    income[q] += 1
}

for i in 0..<N{
    arr[i].sort(by: {
        $0.cost==$1.cost ? $0.num<$1.num:$0.cost > $1.cost
    })
}

var q = [0]
var idx = 0

while idx < q.count{
    let currNum = q[idx]
    
    for next in arr[currNum]{
        let nextNum = next.num
        let nextCost = next.cost
        
        cost[nextNum] = max(cost[nextNum], cost[currNum]+nextCost)
        income[nextNum] -= 1
        
        if income[nextNum] == 0{
            if nextNum == 0{ break }
            q.append(nextNum)
        }
    }
    
    idx += 1
}

var visited = Array(repeating: false, count: N)

func dfs(curr:Int, score:Int, ans:[String]){
    if score == cost[0]{
        print(ans.joined(separator: " "))
        return
    }
    
    for next in arr[curr]{
        let nextNum = next.num
        let nextCost = next.cost
        
        if score+nextCost == cost[nextNum] && !visited[nextNum]{
            visited[nextNum] = true
            dfs(curr: nextNum, score: score+nextCost, ans: ans+["\(nextNum+1)"])
        }
    }
}

print(cost[0])
dfs(curr: 0, score: 0, ans: ["1"])