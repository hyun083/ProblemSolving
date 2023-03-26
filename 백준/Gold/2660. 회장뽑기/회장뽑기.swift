import Foundation

let n = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: 51, count: n), count: n)
var candidates = Array(repeating: 0, count: n)
while let input = readLine(){
    if input == "-1 -1"{
        break
    }
    let line = input.split(separator: " ").map{Int(String($0))!}
    let u = line[0] - 1
    let v = line[1] - 1
    arr[u][v] = 1
    arr[v][u] = 1
}
for k in 0..<n{
    for u in 0..<n{
        for v in 0..<n{
            if u==v {continue}
            arr[u][v] = min(arr[u][v], arr[u][k]+arr[k][v])
        }
    }
}

for u in 0..<n{
    for v in 0..<n{
        if u==v{continue}
        candidates[u] = max(candidates[u], arr[u][v])
    }
}
let value = candidates.min()!
var result = ""
var cnt = 0
for i in 0..<n{
    if candidates[i] == value{
        result += "\(i+1) "
        cnt += 1
    }
}
print(value,cnt)
print(result)