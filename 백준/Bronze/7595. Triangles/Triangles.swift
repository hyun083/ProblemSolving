while let line = readLine(){
    let N = Int(line)!
    if N == 0 {break}
    var output = "*"
    for _ in 0..<N{
        print(output)
        output.append("*")
    }
}