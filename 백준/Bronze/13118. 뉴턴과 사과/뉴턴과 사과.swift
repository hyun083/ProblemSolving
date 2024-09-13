var p = readLine()!.split(separator: " ").map{Int($0)!}
let xyr = readLine()!.split(separator: " ").map{Int($0)!}
var ans = 0

for i in 0..<4{
    if p[i] == xyr[0]{
        ans = i+1
    }
}
print(ans)