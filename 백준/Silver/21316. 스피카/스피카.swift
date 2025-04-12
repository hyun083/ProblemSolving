import Foundation

var indegree = Array(repeating: 0, count: 12)
var map = Array(repeating: [Int](), count: 12)

for _ in 0..<12{
    let UV = readLine()!.split(separator: " ").map{Int($0)!-1}
    let u = UV[0]
    let v = UV[1]
    indegree[u] += 1
    indegree[v] += 1
    
    map[u].append(v)
    map[v].append(u)
}

func check(from curr:Int) -> Bool{
    var arr = [Int]()
    
    for next in map[curr]{
        arr.append(indegree[next])
    }
    
    arr.sort(by: <)
    return arr==[1,2,3]
}

for i in 0..<12{
    if indegree[i]==3 && check(from: i){
        print(i+1)
        break
    }
}