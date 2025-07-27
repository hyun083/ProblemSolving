let N = Int(readLine()!)!
let target = readLine()!.split(separator: " ").map{Int($0)!}
let value = readLine()!.split(separator: " ").map{Int($0)!}
var ans = 0
for i in 0..<N{
    ans += target[i]<=value[i] ? 1:0
}
print(ans)