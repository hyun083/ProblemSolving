let S = readLine()!
var arr = [String]()
for i in S.indices{
    arr.append(String(S[i..<S.endIndex]))
}
print(arr.sorted().joined(separator: "\n"))