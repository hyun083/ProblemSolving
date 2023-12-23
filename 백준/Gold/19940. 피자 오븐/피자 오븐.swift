import Foundation

let t = Int(readLine()!)!

for _ in 0..<t{
    let N = Int(readLine()!)!
    var ans = ""
    
    var visited = Set<Int>()
    let dx = [60,10,-10,1,-1]
    visited.insert(0)
    var q:[(num:Int, res:[Int])] = [(0,[N/60,0,0,0,0])]
    var idx = 0
    
    while idx < q.count{
        let curr = q[idx]
        
        if curr.num == N%60{
            ans = curr.res.map{String($0)}.joined(separator: " ")
            break
        }
        
        for i in stride(from: 4, through: 0, by: -1){
            let next = curr.num+dx[i]
            var nextArr = curr.res
            if next<0 || next>60 { continue }
            if visited.contains(next) { continue }
            visited.insert(next)
            nextArr[i] += 1
            q.append((next,nextArr))
        }
        
        idx += 1
    }
    print(ans)
}