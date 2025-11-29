let N = Int(readLine()!)!
for _ in 0..<N{
    let cost = readLine()!.map{String($0)}
    print(cost.count)
}