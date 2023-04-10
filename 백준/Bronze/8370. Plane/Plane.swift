let seats = readLine()!.split(separator: " ").map{Int(String($0))!}
print(seats[0]*seats[1] + seats[2]*seats[3])