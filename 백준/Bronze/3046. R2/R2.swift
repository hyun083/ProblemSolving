let line = readLine()!.split(separator: " ").map{Int(String($0))!}
let R1 = line[0]
let S = line[1]
print(S*2-R1)