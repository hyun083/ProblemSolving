import Foundation

let N = Int(readLine()!)!
var arr = [(start:Int, end:Int)]()
for _ in 0..<N{
    let UV = readLine()!.split(separator: " ").map{Int($0)!}
    let U = UV[0]
    let V = UV[1]
    arr.append( (start:U, end:V) )
}
arr.sort { $0.start < $1.start }
var ans = 0
var S = 0
var E = 0

for line in arr{
    if E < line.start{
        ans += E-S
        S = line.start
        E = line.end
    }else{
        E = max(E, line.end)
    }
}
ans += E-S
print(ans)