var scores = readLine()!.split(separator: " ").map{Int(String($0))!}
var ratio = [56,24,14,6]
for i in 0..<4{ scores[i] *= ratio[i] }
print(scores.reduce(0, +))