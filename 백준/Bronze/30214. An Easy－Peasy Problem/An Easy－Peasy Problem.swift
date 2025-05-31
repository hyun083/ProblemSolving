let S = readLine()!.split(separator: " ").map{Int($0)!}
print(S[0]*2>=S[1] ? "E":"H")