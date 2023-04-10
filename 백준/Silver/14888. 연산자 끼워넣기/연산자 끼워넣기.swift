import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var op = readLine()!.split(separator: " ").map{Int(String($0))!}
var operands = [[Int]]()
var temp = [Int]()
var maximum = Int.min
var minimum = Int.max
func btk(result:Int, count:Int){
    if count == n-1{
        maximum = max(maximum, result)
        minimum = min(minimum,result)
        return
    }
    for i in 0..<4{
        if op[i] > 0 {
            op[i] -= 1
            if i == 0{
                btk(result: result+arr[count+1], count: count+1)
            }else if i == 1{
                btk(result: result-arr[count+1], count: count+1)
            }else if i == 2{
                btk(result: result*arr[count+1], count: count+1)
            }else{
                btk(result: result/arr[count+1], count: count+1)
            }
            op[i] += 1
        }
    }
}
btk(result: arr[0], count: 0)
print(maximum)
print(minimum)