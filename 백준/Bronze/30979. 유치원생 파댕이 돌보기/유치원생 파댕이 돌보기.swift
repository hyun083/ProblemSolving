let T = Int(readLine()!)!
let N = Int(readLine()!)!
let sum = readLine()!.split(separator: " ").map{Int($0)!}.reduce(0, +)
print(sum>=T ? "Padaeng_i Happy":"Padaeng_i Cry")