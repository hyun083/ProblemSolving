import Foundation

var num = 0
var cmd = ""
var arr = Array(repeating: true, count: 10)

while let input = readLine() {
    if input == "0"{ break }
    
    if input == "too high" {
        for i in num..<10{ arr[i] = false }
    }else if input == "too low" {
        for i in 0...num{ arr[i] = false }
    }else if input == "right on"{
        print(arr[num] ? "Stan may be honest":"Stan is dishonest")
        arr = Array(repeating: true, count: 10)
    }else{
        num = Int(input)!-1
    }
}