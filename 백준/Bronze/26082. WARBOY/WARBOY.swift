let line = readLine()!.split(separator: " ").map{Int($0)!}
print(3*line[1]/line[0]*line[2])