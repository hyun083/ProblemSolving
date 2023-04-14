import Foundation

let T = Int(readLine()!)!
var ans = [String]()

for _ in 0..<T{
    let line = readLine()!.split(separator:" ").map{Int($0)!}
    let S = line[0]
    let T = line[1]
    var result = Int.max
    
    func bfs(from A:Int, to B:Int, cnt:Int){
        if A == B{
            result = min(result, cnt)
            return
        }
        
        if A>B{ return }
        
        bfs(from: A+A, to: B+3, cnt: cnt+1)
        bfs(from: A+1, to: B, cnt: cnt+1)
    }
    
    bfs(from: S, to: T, cnt: 0)
    ans.append("\(result)")
}
print(ans.joined(separator: "\n"))