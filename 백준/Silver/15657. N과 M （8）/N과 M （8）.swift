import Foundation

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}

let N = inputs[0]
let M = inputs[1]

var num = readLine()!.split(separator: " ").map{Int(String($0))!}
num.sort(by: <)
var arr = [String]()
var ans = [String]()
func dfs(numb:Int, cnt:Int){
    if cnt == M{
        if arr.count == M{
            ans.append(arr.joined(separator: " "))
        }
        return
    }
    
    for i in numb..<N{
        arr.append(String(num[i]))
        dfs(numb: i, cnt: cnt+1)
        
        arr.removeLast()
    }
}

dfs(numb: 0, cnt: 0)
print(ans.joined(separator: "\n"))