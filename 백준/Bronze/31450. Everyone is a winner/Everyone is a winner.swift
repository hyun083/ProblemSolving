let MK = readLine()!.split(separator: " ").map{Int($0)!}
let M = MK[0]
let K = MK[1]
print(M%K == 0 ? "Yes":"No")