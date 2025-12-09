let N = Int(readLine()!)!
var ans = 0
for _ in 0..<N{
    let HW = readLine()!.split(separator: " ").map{Int($0)!}
    let H = HW[0]
    let W = HW[1]
    
    ans = max(ans,H*W)
}
print(ans)