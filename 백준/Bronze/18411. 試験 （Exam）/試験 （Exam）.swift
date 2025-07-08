let score = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: >)
print(score[0] + score[1])