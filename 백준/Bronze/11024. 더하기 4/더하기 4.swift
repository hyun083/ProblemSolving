let T = Int(readLine()!)!
for _ in 0..<T{
    let ans = readLine()!.split(separator: " ").map{Int($0)!}.reduce(0, +)
    print(ans)
}