import Foundation

let N = Int(readLine()!)!
func han(num:String) -> Bool{
    if Int(num)! < 10{
        return true
    }else{
        let number = num.map{Int(String($0))!}
        let distance = number[0] - number[1]
        for i in 0..<number.count-1{
            if number[i]-number[i+1] != distance{
                return false
            }
        }
        return true
    }
}
var cnt = 0
for i in 1...N{
    if han(num: String(i)){
        cnt += 1
    }
}
print(cnt)