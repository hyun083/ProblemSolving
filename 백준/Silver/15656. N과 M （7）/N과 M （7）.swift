import Foundation

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}

let N = inputs[0]
let M = inputs[1]

var num = readLine()!.split(separator: " ").map{Int(String($0))!}
num.sort(by: <)
var ans = [String]()
var res = [String]()
func dfs(cnt:Int){
    if cnt == M{
        if ans.count == M{
            res.append(ans.joined())
        }
        return
    }
    
    for i in 0..<N{
        ans.append(String(num[i]) + " ")
        dfs(cnt: cnt+1)
        
        ans.removeLast()
    }
}
dfs(cnt: 0)
print(res.joined(separator: "\n"))