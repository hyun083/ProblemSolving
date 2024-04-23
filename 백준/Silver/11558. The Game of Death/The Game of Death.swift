import Foundation

let T = Int(readLine()!)!

for _ in 0..<T{
    let N = Int(readLine()!)!
    var visited = Array(repeating: false, count: N)
    var map = [Int]()
    var ans = [Int]()
    
    for _ in 0..<N{
        map.append(Int(readLine()!)!-1)
    }
    
    func dfs(from curr:Int){
        let next = map[curr]
        if !visited[next]{
            visited[next] = true
            ans.append(next)
            dfs(from: next)
        }
    }
    
    visited[0] = true
    dfs(from: 0)
    
    if let res = ans.firstIndex(of: N-1){
        print(res+1)
    }else{
        print(0)
    }
}