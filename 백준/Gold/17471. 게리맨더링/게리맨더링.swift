import Foundation

let N = Int(readLine()!)!
var population = readLine()!.split(separator: " ").map{Int($0)!}
var total = population.reduce(0, +)
var edges = [(u:Int, v:Int)]()
var ans = Int.max

for u in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let n = info[0]
    if n == 0{ continue }
    for i in 1...n{ edges.append((u,info[i]-1))}
}

var list = [[String]]()
func btk(team:[String]){
    var team = team
    if team.count == N{
        list.append(team)
        return
    }
    team.append("R")
    btk(team: team)
    team.removeLast()
    
    team.append("B")
    btk(team: team)
}
btk(team: [])

for team in list{
    var arr = population.map{-1*$0}
    var cnt = N
    var red = 0
    var blue = 0
    
    for i in 0..<N{
        if team[i] == "R"{
            red += population[i]
        }else{
            blue += population[i]
        }
    }
    
    func root(of node:Int) -> Int{
        if arr[node] < 0{ return node }
        arr[node] = root(of: arr[node])
        return arr[node]
    }
    
    func union(a:Int, b:Int){
        let A = root(of: a)
        let B = root(of: b)
        
        if team[a] != team[b] { return }
        if A==B { return }
        
        arr[A] += arr[B]
        arr[B] = A
        cnt -= 1
    }
    
    for edge in edges {
        union(a: edge.u, b: edge.v)
    }
    
    if cnt == 2{
        ans = min(ans,abs(red-blue))
    }
}
print(ans==Int.max ? -1:ans)