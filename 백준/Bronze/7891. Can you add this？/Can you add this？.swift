let n = Int(readLine()!)!
for _ in 0..<n{
let sum = readLine()!.split(separator: " ").map{Int($0)!}
    print(sum[0]+sum[1])
}