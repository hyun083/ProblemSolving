import Foundation

var arr = [Int]()
for _ in 0..<4{
    arr.append(Int(readLine()!)!)
}
var constant = 0
var rising = 0
var diving = 0

for i in 1..<4{
    if arr[i-1] == arr[i]{
        constant += 1
    }else if arr[i-1] < arr[i]{
        rising += 1
    }else if arr[i-1] > arr[i]{
        diving += 1
    }
}

if constant == 3 {
    print("Fish At Constant Depth")
} else if rising == 3 {
    print("Fish Rising")
} else if diving == 3 {
    print("Fish Diving")
} else {
    print("No Fish")
}