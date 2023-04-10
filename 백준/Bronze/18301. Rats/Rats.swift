let num = readLine()!.split(separator: " ").map{Int(String($0))!}
print((num[0]+1)*(num[1]+1)/(num[2]+1)-1)