let N = Int(readLine()!)!
for _ in 0..<N{
    let S = readLine()!.map{String($0)}
    if S.contains("S"){
        print(S.joined())
    }
}