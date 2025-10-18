let T = Int(readLine()!)!

for _ in 0..<T{
    let info = readLine()!.split(separator: " ").map{String($0)}
    print(info[0]==info[1] ? "OK":"ERROR")
}