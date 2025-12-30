import Foundation

let N = Int(readLine()!)!
let K = Int(readLine()!)!
var ans = Set<String>()
var arr = [String]()
var visited = Array(repeating: false, count: N)

for _ in 0..<N{
    arr.append(readLine()!)
}


func btk(curr:Int, res:[String], cnt:Int){
    if cnt == K{
        ans.insert(res.joined())
        return
    }
    
    var tmp = res
    for i in 0..<N{
        if visited[i]{ continue }
        tmp.append(arr[i])
        visited[i] = true
        btk(curr: i+1, res: tmp, cnt: cnt+1)
        tmp.removeLast()
        visited[i] = false
    }
}

btk(curr: 0, res: [], cnt: 0)
print(ans.count)