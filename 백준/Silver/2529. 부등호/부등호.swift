import Foundation

let n = Int(readLine()!)!
let line = readLine()!.split(separator: " ").map{String($0)}
var visited = Array(repeating: false, count: 10)
var result = [Int]()
var myMax = "0000000000"
var myMin = "9999999999"

func btk(cnt:Int){
    if cnt == n{
        var temp = ""
        for result in result {
            temp.append(String(result))
        }
        myMax = max(myMax, temp)
        myMin = min(myMin, temp)
        return
    }
    for next in 0..<10{
        if !visited[next]{
            if line[cnt] == ">" && result.last! > next{
                result.append(next)
                visited[next] = true
                btk(cnt: cnt+1)
                result.removeLast()
                visited[next] = false
            }else if line[cnt] == "<" && result.last! < next{
                result.append(next)
                visited[next] = true
                btk(cnt: cnt+1)
                result.removeLast()
                visited[next] = false
            }
        }
    }
}
for i in 0..<10{
    visited[i] = true
    result.append(i)
    btk(cnt: 0)
    result.removeLast()
    visited[i] = false
}
print(myMax)
print(myMin)