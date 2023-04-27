let NM = readLine()!.split(separator: " ").map{Int($0)!}
print(NM[0]*100>=NM[1] ? "Yes":"No")