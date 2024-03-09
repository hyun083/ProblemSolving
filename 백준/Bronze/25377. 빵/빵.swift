let N = Int(readLine()!)!
var ans = -1

for _ in 0..<N{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    let A = line[0]
    let B = line[1]
    if A>B { continue }
    
    ans = ans<0 ? B:min(ans, B)
}
print(ans)