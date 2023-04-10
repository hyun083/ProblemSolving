import Foundation

let n = Int(readLine()!)!
var res = [String]()
var stack = [String]()
var numbers = ["0","1","2","3","4","5","6","7","8","9","10"]
var visited = Array(repeating: false, count: n+1)
var ans = [String]()

func btk(cnt:Int, limit:Int, prev:Int){
    if cnt == n{
        ans.append(res.joined(separator: " "))
        return
    }
    for i in 1...n{
        if !visited[i]{
            if prev<i{
                if limit+1<=i{
                    visited[i] = true
                    res.append(numbers[i])
                    btk(cnt: cnt+1, limit: max(limit, i), prev: i)
                    res.removeLast()
                    visited[i] = false
                }
            }else{
                var flag = true
                for i in i+1...prev{
                    if !res.contains(String(i)){
                        flag = false
                        break
                    }
                }
                if flag{
                    visited[i] = true
                    res.append(numbers[i])
                    btk(cnt: cnt+1, limit: max(limit, i), prev: i)
                    res.removeLast()
                    visited[i] = false
                }
            }
        }
    }
}
btk(cnt: 0, limit: 0, prev: 0)
print(ans.joined(separator: "\n"))