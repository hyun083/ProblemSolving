let AI = readLine()!.split(separator: " ").map{Int(String($0))!}
let A = AI[0]
let I = AI[1] - 1
print(A*I+1)