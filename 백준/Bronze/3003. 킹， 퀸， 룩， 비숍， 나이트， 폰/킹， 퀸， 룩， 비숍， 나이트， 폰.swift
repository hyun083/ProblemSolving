let piece = [1,1,2,2,2,8]
let line = readLine()!.split(separator: " ").map{Int(String($0))!}
for i in 0..<6{
    print(piece[i] - line[i],terminator: " ")
}