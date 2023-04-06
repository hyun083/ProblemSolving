import Foundation

let T = Int(readLine()!)!
for _ in 0..<T{
    let N = Int(readLine()!)!
    let line = readLine()!.split(separator: " ").map{Int($0)!-1}
    var arr = Array(repeating: [Int](), count: N)
    var indegree = Array(repeating: 0, count: N)
    var ans = [String]()
    var flag = true
    
    for i in 0..<N-1{
        for k in i+1..<N{
            let U = line[i]
            let V = line[k]
            
            arr[U].append(V)
            indegree[V] += 1
        }
    }
    
    let M = Int(readLine()!)!
    for _ in 0..<M{
        let info = readLine()!.split(separator: " ").map{Int($0)!}
        let A = info[0]-1
        let B = info[1]-1
        
        if line.firstIndex(of: A)! < line.firstIndex(of: B)!{
            arr[B].append(A)
            arr[A].remove(at: arr[A].firstIndex(of: B)!)
            indegree[A] += 1
            indegree[B] -= 1
        }else{
            arr[A].append(B)
            arr[B].remove(at: arr[B].firstIndex(of: A)!)
            indegree[B] += 1
            indegree[A] -= 1
        }
        
    }
    
    var q = [Int]()
    for i in 0..<N{
        if indegree[i] == 0{
            q.append(i)
        }
    }
    
    while !q.isEmpty{
        let curr = q.removeLast()
        
        ans.append("\(curr+1)")
        for next in arr[curr]{
            indegree[next] -= 1
            if indegree[next] == 0{
                q.append(next)
            }
        }
        
        if q.count > 1{
            flag = false
        }
    }
    
    if flag{
        if ans.count == N{
            print(ans.joined(separator: " "))
        }else{
            print("IMPOSSIBLE")
        }
    }else{
        print("?")
    }
}