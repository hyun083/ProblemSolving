let arr = readLine()!.split(separator: " ").map{Int($0)!}
var one = 0
var two = 0
for num in arr{
    one += num==1 ? 1 : 0
    two += num==2 ? 1 : 0
}
print(one>two ? 1:2)