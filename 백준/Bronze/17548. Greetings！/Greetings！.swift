let S = readLine()!.map{String($0)}
var ans = ["h"]
for _ in 0..<S.count-2{
    ans.append("ee")
}
ans.append("y")
print(ans.joined())