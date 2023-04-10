import Foundation

let N = Int(readLine()!)!
var arr = [Int:[Int]]()
var result = ""

for _ in 1...N{
    let number = Int(readLine()!)!
    if number == 0{
        if arr.isEmpty{
            result += "0\n"
        }else{
            let keyIdx = arr.keys.min()!
            let minimumElement = arr[keyIdx]!.min()!
            let minimumElementIdx = arr[keyIdx]!.firstIndex(of: minimumElement)!
            
            result += String(arr[keyIdx]!.remove(at: minimumElementIdx)) + "\n"
            if arr[keyIdx] == []{
                arr.removeValue(forKey: keyIdx)
            }
        }
    }else{
        let key = abs(number)
        if arr[key] != nil {
            arr[key]!.append(number)
        }else{
            arr[key] = [number]
        }
    }
}
print(result)