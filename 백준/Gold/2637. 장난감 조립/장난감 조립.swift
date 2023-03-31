import Foundation

let N = Int(readLine()!)!
let M = Int(readLine()!)!

var arr = Array(repeating: [(num:Int,cost:Int)](), count: N)
var cost = Array(repeating: 0, count: N)
var income = Array(repeating: 0, count: N)
var ans = Array(repeating: 0, count: N)

for _ in 0..<M{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    let X = line[0]-1
    let Y = line[1]-1
    let K = line[2]
    
    income[Y] += 1
    arr[X].append((Y,K))
}

var q = [(Int,Int)]()
for i in 0..<N{
    if income[i] == 0{
        q.append((i,1))
    }
}

var idx = 0
while idx < q.count{
    let currNum = q[idx].0
    let currCost = q[idx].1
    
    if arr[currNum].isEmpty{
        ans[currNum] = cost[currNum]
    }
    
    for next in arr[currNum]{
        income[next.num] -= 1
        cost[next.num] += next.cost * currCost
        
        if income[next.num] == 0{
            q.append((next.num,cost[next.num]))
        }
    }
    
    idx += 1
}

for i in 0..<N{
    if ans[i] > 0{
        print(i+1, ans[i])
    }
}