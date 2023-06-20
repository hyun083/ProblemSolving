let input = readLine()!.map{String($0)}
let rev = Array(input.reversed())
print(input==rev ? 1:0)