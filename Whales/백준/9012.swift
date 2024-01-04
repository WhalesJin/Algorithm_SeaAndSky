// 괄호 문자열(Parenthesis String, PS)은 두 개의 괄호 기호인 ‘(’ 와 ‘)’ 만으로 구성되어 있는 문자열이다.
// 그 중에서 괄호의 모양이 바르게 구성된 문자열을 올바른 괄호 문자열(Valid PS, VPS)이라고 부른다.
//
// 여러분은 입력으로 주어진 괄호 문자열이 VPS 인지 아닌지를 판단해서 그 결과를 YES 와 NO 로 나타내어야 한다.

// ( -> stack.append
// ) -> last == ( 이면 remove 아니면 다 NO

/*
// 처음 풀이
func 괄호() {
    let count: Int = Int(readLine()!)!
    
    for _ in 1...count {
        let ps = readLine()!
        var stack: [Character] = []
        
        for char in ps {
            if char == "(" {
                stack.append(char)
            } else if stack.popLast() != "(" {
                stack.append("N")
                break
            }
        }
        
        if stack.isEmpty {
            print("YES")
        } else {
            print("NO")
        }
    }
}
*/

// 수정본
func 괄호() {
    let count: Int = Int(readLine()!)! // 타입명 명시O->12ms / 명시X->8ms 왜지🤔
    
    for _ in 1...count {
        let ps = readLine()!
        var stack: [Character] = []
        
        for char in ps {
            if char == ")" && stack.last == "(" {
                stack.removeLast()
            } else {
                stack.append(char)
            }
        }
        
        print(stack.isEmpty ? "YES" : "NO")
    }
}
