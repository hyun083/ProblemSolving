for _ in 0..<Int(readLine()!)!{
    let numbers = readLine()!.split(separator: ",").map{Int(String($0))!}
    print(numbers.reduce(0, +))
}