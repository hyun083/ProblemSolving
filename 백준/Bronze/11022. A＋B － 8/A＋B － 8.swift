for t in 1...Int(readLine()!)!{
    let numbers = readLine()!.split(separator: " ").map{Int(String($0))!}
    print("Case #\(t):",numbers[0],"+",numbers[1],"=",numbers.reduce(0, +))
}