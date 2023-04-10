import Foundation

let x = readLine()!
let n = x.count
var arr = x.map{String($0)}
var visited = Array(repeating: false, count: n)
var result = ""
var ans = [String]()

func btk(cnt:Int){
    if result.count == n{
        if result > x{
            ans.append(result)
        }
    }
    for i in 0..<n{
        if !visited[i]{
            result.append(arr[i])
            visited[i] = true
            btk(cnt: cnt+1)
            result.removeLast()
            visited[i] = false
        }
    }
}

for i in 0..<n{
    result.append(arr[i])
    visited[i] = true
    btk(cnt: 0)
    result.removeLast()
    visited[i] = false
}
if ans.isEmpty{
    print(0)
}else{
    print(ans.min()!)
}