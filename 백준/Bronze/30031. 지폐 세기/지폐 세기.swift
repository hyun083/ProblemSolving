let N = Int(readLine()!)!
var value = [136:1000,142:5000,148:10000,154:50000]
var ans = 0

for _ in 0..<N{
    let WH = readLine()!.split(separator: " ").map{Int($0)!}
    ans += value[WH[0]]!
}
print(ans)