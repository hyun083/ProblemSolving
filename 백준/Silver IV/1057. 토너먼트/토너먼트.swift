import Foundation

let info = readLine()!.split(separator: " ").map{Int($0)!}
let N = info[0]
var A = info[1]<info[2] ? info[1]:info[2]
var B = info[1]>info[2] ? info[1]:info[2]

var arr = [Int](1...N)
var ans = 0

while arr.count > 1{
    ans += 1
    var tmp = [Int]()
    var idx = 0
    var flag = false
    
    if arr.count % 2 == 0{
        while idx < arr.count{
            if arr[idx] == A && arr[idx+1] == B{
                flag = true
                break
            }else if arr[idx]==A || arr[idx+1]==A{
                tmp.append(A)
            }else if arr[idx]==B || arr[idx+1]==B{
                tmp.append(B)
            }else{
                tmp.append(arr[idx])
            }
            idx += 2
        }
    }else{
        while idx < arr.count-1{
            if arr[idx] == A && arr[idx+1] == B{
                flag = true
                break
            }else if arr[idx]==A || arr[idx+1]==A{
                tmp.append(A)
            }else if arr[idx]==B || arr[idx+1]==B{
                tmp.append(B)
            }else{
                tmp.append(arr[idx])
            }
            idx += 2
        }
        tmp.append(arr.last!)
    }
    if flag{ break }
    arr = tmp
}
print(ans)