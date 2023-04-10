import Foundation

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}

let N = inputs[0]
let M = inputs[1]

var num = readLine()!.split(separator: " ").map{Int(String($0))!}
var visited = Array(repeating: false, count: N)
num.sort(by: <)

var arr = [String]()

func dfs(mem:Int, cnt:Int){
    if cnt == M{
        if arr.count == M{
            print(arr.joined())
        }
        return
    }
    
    for i in mem..<N{
        if visited[i] == false{
            visited[i] = true
            arr.append(String(num[i]) + " ")
            dfs(mem: i, cnt: cnt+1)
            
            arr.removeLast()
            visited[i] = false
        }
    }
}

dfs(mem: 0, cnt: 0)