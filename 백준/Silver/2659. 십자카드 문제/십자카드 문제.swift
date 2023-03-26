import Foundation

var target = readLine()!.split(separator: " ").map{String($0)}
var targets = [String]()
for _ in 0..<4{
    targets.append(target.joined())
    target.append(target.removeFirst())
}

var temp = [Int]()
var ans = Set<String>()

func btk(cnt:Int){
    if cnt == 4{
        var arr = [String]()
        for _ in 0..<4{
            arr.append(temp.map{String($0)}.joined())
            temp.append(temp.removeFirst())
        }
        ans.insert(arr.min()!)
        return
    }
    for i in 1..<10{
        temp.append(i)
        btk(cnt: cnt+1)
        temp.removeLast()
    }
}
btk(cnt: 0)
print(ans.sorted(by: <).firstIndex(of: targets.min()!)! + 1)