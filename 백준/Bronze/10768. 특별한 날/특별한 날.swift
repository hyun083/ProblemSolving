import Foundation

let month = Int(readLine()!)!
let day = Int(readLine()!)!

if month < 2{
    print("Before")
}else if month == 2{
    if day<18{
        print("Before")
    }else if day==18{
        print("Special")
    }else{
        print("After")
    }
}else{
    print("After")
}