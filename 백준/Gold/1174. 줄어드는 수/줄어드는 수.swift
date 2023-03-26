import Foundation

let n = Int(readLine()!)!-1
var numbers = ["0","1","2","3","4","5","6","7","8","9"]
var visited = Array(repeating: false, count: 10)

var pick = [String]()
var ans = ["0","1","2","3","4","5","6","7","8","9"]

func btk(cnt:Int, length:Int){
    if cnt == length{
        var flag = true
        for i in 0..<cnt-1{
            if pick[i] <= pick[i+1]{
                flag = false
                break
            }
        }
        if flag{
            ans.append(pick.joined())
        }
        return
    }
    for i in length-cnt-1..<10{
        if !visited[i]{
            visited[i] = true
            pick.append(numbers[i])
            btk(cnt: cnt+1,length: length)
            pick.removeLast()
            visited[i] = false
        }
    }
}
for i in 2...10{
    btk(cnt: 0, length: i)
}
if n >= ans.count{
    print(-1)
}else{
    print(ans[n])
}