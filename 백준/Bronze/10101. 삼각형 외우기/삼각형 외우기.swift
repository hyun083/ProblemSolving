import Foundation

var arr = [Int]()
var sum = 0
for _ in 0..<3{
    let angle = Int(readLine()!)!
    arr.append(angle)
    sum += angle
}

if sum == 180{
    let x = arr[0]
    let y = arr[1]
    let z = arr[2]
    
    if x==60 && y==60 && z==60{
        print("Equilateral")
    }else if x==y || y==z || x==z{
        print("Isosceles")
    }else{
        print("Scalene")
    }
}else{
    print("Error")
}