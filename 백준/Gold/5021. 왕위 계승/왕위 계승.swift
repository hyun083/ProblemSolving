import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]
var king = readLine()!

var cost = Dictionary<String,Int>()
var indegree = Dictionary<String,Int>()
var arr = Dictionary<String,[String]>()
arr[king] = [String]()
indegree[king] = 0
cost[king] = Int.max

for _ in 0..<N{
    let line = readLine()!.split(separator: " ").map{String($0)}
    let son = line[0]
    let p1 = line[1]
    let p2 = line[2]
    
    if arr[p1] == nil{
        arr[p1] = [son]
    }else{
        arr[p1]!.append(son)
    }
    
    if arr[p2] == nil{
        arr[p2] = [son]
    }else{
        arr[p2]!.append(son)
    }
    
    if cost[p1] == nil {
        cost[p1] = 0
    }
    
    if cost[p2] == nil{
        cost[p2] = 0
    }
    
    if cost[son] == nil{
        cost[son] = 0
    }
    
    if indegree[p1] == nil{
        indegree[p1] = 0
    }
    
    if indegree[p2] == nil{
        indegree[p2] = 0
    }
    
    if indegree[son] == nil{
        indegree[son] = 2
    }else{
        indegree[son]! += 2
    }
}

var q = [(name:String, blood:Int)]()
for duke in indegree{
    if duke.value == 0{
        q.append((duke.key,cost[duke.key]!))
    }
}

var idx = 0
while idx<q.count{
    let curr = q[idx].name
    let blood = q[idx].blood
    
    if arr[curr] != nil{
        for next in arr[curr]!{
            indegree[next]! -= 1
            cost[next]! += blood==0 ? 0:blood/2
            if indegree[next] == 0{
                q.append((next,cost[next]!))
            }
        }
    }
    
    idx += 1
}

var ansMax = 0
var newKing = String()

for _ in 0..<M{
    let candidate = readLine()!
    if cost[candidate] != nil{
        if cost[candidate]! > ansMax{
            ansMax = cost[candidate]!
            newKing = candidate
        }
    }
}
print(newKing)