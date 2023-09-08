import Foundation

var visited = Array(repeating: Array(repeating: false, count: 1001), count: 1001)
let s = Int(readLine()!)!
var ans = -1

func bfs(){
    var q = [(value:Int, clipBoard:Int, level:Int)]()
    var idx = 0
    
    q.append((1,0,0))
    
    while idx<q.count{
        let curr = q[idx]
        
        if curr.value == s{
            ans = curr.level
            return
        }
        
        if !visited[curr.value][curr.value]{
            visited[curr.value][curr.value] = true
            q.append((curr.value, curr.value, curr.level+1))
        }
        
        if curr.value + curr.clipBoard <= 1000 && !visited[curr.value + curr.clipBoard][curr.clipBoard]{
            visited[curr.value + curr.clipBoard][curr.clipBoard] = true
            q.append((curr.value + curr.clipBoard, curr.clipBoard, curr.level+1))
        }
        
        if curr.value-1 > 0 && !visited[curr.value-1][curr.clipBoard]{
            visited[curr.value-1][curr.clipBoard] = true
            q.append((curr.value-1, curr.clipBoard, curr.level+1))
        }
        
        idx += 1
    }
}

bfs()
print(ans)