let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}
let v = Int(readLine()!)!
var ans = 0
for number in arr{
    if number == v{ ans += 1 }
}
print(ans)