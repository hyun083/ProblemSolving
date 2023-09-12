import Foundation

let T = Int(readLine()!)!
var prime = Array(repeating: true, count: 10000)
prime[0] = false

for num in 2..<10000{
    if prime[num] {
        var nx = 2
        while num*nx < 10000{
            prime[num*nx] = false
            nx += 1
        }
    }
}

func bfs(from origin:Int, to target:Int) -> Int{
    var visited = Array(repeating: false, count: 10000)
    var q = [(pwd:Int, cnt:Int)]()
    var idx = 0
    let dx = [1000,100,10,1]
    
    visited[origin] = true
    q.append((origin,0))
    
    while idx < q.count{
        let curr = q[idx]
        
        if curr.pwd == target{
            return curr.cnt
        }
        
        var num = curr.pwd
        var arr = [Int]()
        
        arr.append(num/1000); num%=1000
        arr.append(num/100); num%=100
        arr.append(num/10); num%=10
        arr.append(num)
        
        for i in 0..<4{
            var newArr = arr
            for newNum in 0..<10{
                if i==0 && newNum==0 { continue }
                if newNum == arr[i]{ continue }
                newArr[i] = newNum
                
                var newPwd = 0
                for i in 0..<4{ newPwd += newArr[i]*dx[i] }
                
                if prime[newPwd] && !visited[newPwd]{
                    visited[newPwd] = true
                    q.append((newPwd, curr.cnt+1))
                }
            }
        }
        
        idx += 1
    }
    
    return -1
}

for _ in 0..<T{
    let (u,v) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
    let ans = bfs(from: u, to: v)
    print(ans<0 ? "Impossible":ans)
}