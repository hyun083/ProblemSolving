let AB = readLine()!.split(separator: " ").map{Int($0)!}
let A = AB[0]
let B = AB[1]
print(max(A+B,A-B))
print(min(A+B,A-B))