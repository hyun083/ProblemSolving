import Foundation

let n = Int(readLine()!)!
var arr = [String]()
var ans = ""

for _ in 0..<n{ arr.append(readLine()!) }

var head = 0
var tail = n-1
var cnt = 0

while head <= tail{
    if cnt%80==0 && cnt>0{ ans.append("\n") }
    if head == tail{
        ans.append(arr[head])
        break
    }
    if arr[tail] < arr[head]{
        ans.append(arr[tail])
        tail -= 1
    }else if arr[tail] == arr[head]{
        let h = arr[head...tail].joined()
        let t = String(h.reversed())
        if h<=t{
            ans.append(arr[head])
            head += 1
        }else{
            ans.append(arr[tail])
            tail -= 1
        }
    }else{
        ans.append(arr[head])
        head += 1
    }
    cnt += 1
}
print(ans)