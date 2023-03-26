let LP = readLine()!.split(separator: " ").map{Int(String($0))!}
let news = readLine()!.split(separator: " ").map{Int(String($0))!}
let num = LP[0]*LP[1]
for n in news{
    print(n-num,terminator: " ")
}