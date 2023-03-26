import Foundation

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}

let N = inputs[0]
let K = inputs[1]

var map = Array(repeating: false, count: 100001)
let n = [-1,1,2]

func bfs(from dept:Int, to dest:Int)->Int{
    var cnt = 0
    var q = [Int]()
    var dq = [Int]()
    q.append(dept)
    map[dept] = true
    
    while !q.isEmpty {
        cnt += 1
        dq = q.reversed()
        q.removeAll()
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            for i in 0...2{
                var next = curr
                if i==2 { next *= n[i]}
                else {next += n[i]}
                if next<0 || next>100000 {
                    continue
                }
                if next == K { return cnt }
                if map[next] == false{
                    map[next] = true
                    q.append(next)
                }
            }
        }
    }
    return -1
}

if N==K{ print(0) }
else{ print(bfs(from: N, to: K)) }