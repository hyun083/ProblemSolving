import Foundation

var arr = readLine()!.split(separator: " ").map{Int($0)!}
let sum = arr.reduce(0, +)
var check = Set<[Int]>()
check.insert(arr)
var ans = 1

var visited = Array(repeating: Array(repeating: false, count: 1501), count: 1501)

func bfs(){
    var q = [(A:Int, B:Int)]()
    var idx = 0
    
    q.append((arr[0],arr[1]))
    visited[arr[0]][arr[1]] = true
    
    while idx < q.count{
        let curr = q[idx]
        let A = curr.A
        let B = curr.B
        let C = sum-A-B
        let tmp = [A,B,C]
        
        for i in 0..<3{
            for k in 0..<3{
                if tmp[i]<tmp[k]{
                    if visited[tmp[i]*2][tmp[k]-tmp[i]] { continue }
                    visited[tmp[i]*2][tmp[k]-tmp[i]] = true
                    q.append((tmp[i]*2,tmp[k]-tmp[i]))
                }
            }
        }
        idx += 1
    }
}

if sum%3>0{
    print("0")
}else{
    bfs()
    print(visited[sum/3][sum/3] ? 1:0)
}