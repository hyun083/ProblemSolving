let N = Int(readLine()!)!
var ans = readLine()!.split(separator: " ").map{Int($0)!}.reduce(0, +)
print(ans==0 ? "Stay":ans>0 ? "Right":"Left")