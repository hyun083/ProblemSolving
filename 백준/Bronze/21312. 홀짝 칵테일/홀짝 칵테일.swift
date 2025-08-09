import Foundation

let arr = readLine()!.split(separator: " ").map{Int($0)!}
let X = arr[0]
let Y = arr[1]
let Z = arr[2]
var odd = [Int]()
var even = [Int]()

for num in arr{
    if num%2 == 0{
        even.append(num)
    }else{
        odd.append(num)
    }
}

if (X*Y)%2 == 0{
    even.append(X*Y)
}else{
    odd.append(X*Y)
}

if (X*Z)%2 == 0{
    even.append(X*Z)
}else{
    odd.append(X*Z)
}

if (Y*Z)%2 == 0{
    even.append(Y*Z)
}else{
    odd.append(Y*Z)
}

if (X*Y*Z)%2 == 0{
    even.append(X*Y*Z)
}else{
    odd.append(X*Y*Z)
}

print(odd.max() ?? even.max()!)