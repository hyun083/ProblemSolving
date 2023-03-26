let num = readLine()!.split(separator: " ").map{Int(String($0))!}
print(abs(num[0]-num[1]))