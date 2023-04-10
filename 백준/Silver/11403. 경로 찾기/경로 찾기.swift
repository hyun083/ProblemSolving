import Foundation
let N = Int(readLine()!)!
var graph = Array(repeating: [String](), count: N)

for i in 0..<N{
    graph[i] = readLine()!.split(separator: " ").map{String($0)}
}
var ans = ""
for i in 0..<N{
    var visited = Array(repeating: "0", count: N)
    func dfs(node:Int){
        for i in 0..<N{
            if graph[node][i] == "1" && visited[i] == "0"{
                visited[i] = "1"
                dfs(node: i)
            }
        }
    }
    dfs(node: i)
    ans += visited.joined(separator: " ") + "\n"
}
print(ans)