let arr = readLine()!.map{String($0)}
var ans = arr.count

for data in arr{
    if data == "_"{
        ans += 5
    }else if data == ":"{
        ans += 1
    }else{
        continue
    }
}
print(ans)