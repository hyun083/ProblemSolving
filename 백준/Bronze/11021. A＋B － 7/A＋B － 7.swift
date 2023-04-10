for t in 1...Int(readLine()!)!{
    print("Case #\(t):",readLine()!.split(separator: " ").map{Int(String($0))!}.reduce(0, +))
}