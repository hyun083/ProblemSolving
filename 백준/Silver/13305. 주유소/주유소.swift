let N = Int(readLine()!)!
let road = readLine()!.split(separator: " ").map{Int(String($0))!}
let station = readLine()!.split(separator: " ").map{Int(String($0))!}

var cost = station[0]
var result = 0

for i in 0..<N-1{
    if cost > station[i]{
       cost = station[i]
    }
    result += cost * road[i]
}
print(result)