import Foundation

let T = Int(readLine()!)!
func bfs(target:Int) -> Int{
    var q = ["1"]
    var idx = 0
    let nx = ["0","1"]
    while idx < q.count{
        let curr = q[idx]
        
        for n in nx{
            let next = Int(curr + n)!
            if next%target==0{
                return next
            }else{
                q.append(String(next))
            }
        }
        idx += 1
    }
    return -1
}

for _ in 0..<T{
    let N = Int(readLine()!)!
    if 1%N==0{
        print(1)
    }else{
        print(bfs(target: N))
    }
}