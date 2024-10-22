import Foundation

let N = Int(readLine()!)!
var arr = [[String]]()

arr.append(["A","B","C","D","E","F","G","H","J","L","M"])
arr.append(["A","C","E","F","G","H","I","L","M"])
arr.append(["A","C","E","F","G","H","I","L","M"])
arr.append(["A","B","C","E","F","G","H","L","M"])
arr.append(["A","C","E","F","G","H","L","M"])
arr.append(["A","C","E","F","G","H","L","M"])
arr.append(["A","C","E","F","G","H","L","M"])
arr.append(["A","C","E","F","G","H","L","M"])
arr.append(["A","C","E","F","G","H","L","M"])
arr.append(["A","B","C","F","G","H","L","M"])
print(arr[N-1].count)
print(arr[N-1].joined(separator: " "))