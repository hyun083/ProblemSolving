let number = readLine()!.map{String($0)}
var flag = number[0]
var cnt = 0

for n in number{
    if n != flag{
        cnt += 1
        flag = n
    }
}
if cnt%2==0{
    print(cnt/2)
}else{
    print(cnt/2+1)
}