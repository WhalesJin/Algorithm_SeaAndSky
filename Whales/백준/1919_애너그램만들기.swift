// 두 영어 단어가 철자의 순서를 뒤바꾸어 같아질 수 있을 때, 그러한 두 단어를 서로 애너그램 관계에 있다고 한다.
// 한 편, dared와 bread는 서로 애너그램 관계에 있지 않다.
// 하지만 dared에서 맨 앞의 d를 제거하고, bread에서 제일 앞의 b를 제거하면,
// ared와 read라는 서로 애너그램 관계에 있는 단어가 남게 된다.
// 
// 두 개의 영어 단어가 주어졌을 때, 두 단어가 서로 애너그램 관계에 있도록 만들기 위해서 제거해야 하는
// 최소 개수의 문자 수를 구하는 프로그램을 작성하시오. (문자를 제거할 때에는 아무 위치에 있는 문자든지 제거 가능)

func 애너그램만들기() {
    let first = Array(readLine()!)
    var second = Array(readLine()!)
    var remove: [Character] = []
    
    for i in 0..<first.count {
        let char = first[i]
        
        if second.contains(char) {
            let index = second.firstIndex(of: char)!
            second.remove(at: index)
        } else {
            remove.append(char)
        }
    }
    
    print(remove.count + second.count)
}

/* 시행착오
예외 - 개수가 다를 때
var same: [Character] = []

for i in first {
    if second.contains(i) {
        same.append(i)
    }
}
*/
