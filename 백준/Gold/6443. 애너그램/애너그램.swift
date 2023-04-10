import Foundation

let T = Int(readLine()!)!
for _ in 0..<T{
    let arr = readLine()!
    let n = arr.count
    var visited = Array(repeating: 0, count: 26)
//    var ans = [String]()
    var str = ""
    for a in arr{
        let idx = Int(a.asciiValue!-97)
        visited[idx] += 1
    }
    func btk(cnt:Int ,curr:Int){
        if cnt == n{
            if str.count == n{
                print(str)
            }
            return
        }
        for i in 0..<26{
            if visited[i] > 0{
                visited[i] -= 1
                str.append(String(UnicodeScalar(UInt8(i+97))))
                btk(cnt: cnt+1, curr: i)
                visited[i] += 1
                str.removeLast()
            }
        }
    }
    btk(cnt: 0, curr: 0)
}