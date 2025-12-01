let N = Int(readLine()!)!
for _ in 0..<N{
    var arr = readLine()!.map{String($0)}
    arr.append(arr.last!=="." ? "":".")
    print(arr.joined())
}