import Foundation

var T = 1
while let input = readLine(){
    if input == "0"{ break }
    let nums = input.map{Int(String($0))!}
    var ans = true
    var open = false
    if nums.first!==1 && nums.last!==2{
        for i in 1..<nums.count-1{
            if !ans { break }
            let pre = nums[i-1]
            let curr = nums[i]
            let post = nums[i+1]

            switch curr {
            case 1:
                ans = false
                continue
            case 2:
                ans = false
                continue
            case 3:
                ans = (pre==4 || pre==6) && (post==4 || post==5) ? true:false
                continue
            case 4:
                ans = (pre==1 || pre==3) && (post==2 || post==3) ? true:false
                continue
            case 5:
                open = true
                ans = (pre==1 || pre==3) && (post==8) ? true:false
                continue
            case 6:
                open = open ? false:true
                ans = (pre==8) && (post==2 || post==3) ? true:false
                continue
            case 7:
                ans = pre==8 && post==8 ? true:false
                continue
            case 8:
                ans = (pre==5 || pre==7) && (post==6 || post==7) ? true:false
                continue
            default:
                continue
            }
        }
    }else{
        ans = false
    }
    ans = open ? false:ans
    print(ans ? "\(T). VALID":"\(T). NOT")
    T += 1
}