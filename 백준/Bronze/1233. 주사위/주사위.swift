import Foundation

let s = readLine()!.split(separator: " ").map{Int($0)!}
let s1 = s[0]
let s2 = s[1]
let s3 = s[2]

var result = [Int:Int]()
for s1 in 1...s1{
    for s2 in 1...s2{
        for s3 in 1...s3{
            let number = s1+s2+s3
            if result[number] == nil{
                result[number] = 1
            }else{
                result[number]! += 1
            }
        }
    }
}
let ans = result.sorted(by: {
    if $0.value == $1.value{
        return $0.key < $1.key
    }else{
        return $0.value > $1.value
    }
})
print(ans.first!.key)