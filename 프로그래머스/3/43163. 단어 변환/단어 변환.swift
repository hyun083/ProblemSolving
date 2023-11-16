import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var map = Array(repeating: [Int](), count:words.count)
    var visited = Array(repeating: false, count:words.count)
    var ans = Int.max
    
    func able(from a:String, to b:String) -> Bool{
        let A = a.map{String($0)}
        let B = b.map{String($0)}
        var res = 0
        
        for i in 0..<A.count{
            if A[i] != B[i]{
                res += 1
            }
        }
        return res==1
    }
    
    for i in 0..<words.count-1{
        for k in i+1..<words.count{
            if able(from: words[i], to:words[k]){
                map[i].append(k)
                map[k].append(i)
            }
        }
    }
    
    if !words.contains(target){ return 0 }
    var v = 0
    
    for i in 0..<words.count{
        if words[i] == target{
            v = i
        }
    }
    
    func bfs(from curr: Int, to dest:Int, cnt:Int){
        print(words[curr], cnt)
        if curr == dest{
            ans = min(ans, cnt)
            return
        }
        
        print(map[curr], visited)
        for next in map[curr]{
            print(curr,"->",next)
            if !visited[next]{
                visited[next] = true
                bfs(from: next, to: dest, cnt: cnt+1)
            }
        }
    }
    
    for i in 0..<words.count{
        if able(from: begin, to:words[i]){
            visited[i] = true
            bfs(from:i, to:v, cnt:1)
        }
    }
    print(map)
    ans = visited[v] ? ans:0
    return ans
}