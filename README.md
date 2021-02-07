# alamofireTutorial-iOS
Alamofire 를 활용한 api 통신을 연습하는 튜토리얼

- https://api.androidhive.info/contacts/ api 를 활용한 Alamofire 통신.
- postman 으로 확인한 api. 예제에서는 name, email, gender 만 가져오기로 함.
<img src = "https://user-images.githubusercontent.com/69136340/107149759-cd4ba200-699d-11eb-94fb-916ceb283759.png" width = "600">

- SwiftyJSON 이 아닌 swift 자체에서 지원하는 Codable 을 사용해보자.
//codable 에 대하 설명 조금.

## 오류1
- tableviewc cell 에 api 에서 가져오 정보를 넣게되면 nil 관련 에럭 나온다. print 해보면 값은 출력되는데 무슨 문제일까?
<img src = "https://user-images.githubusercontent.com/69136340/107149870-709cb700-699e-11eb-9d94-e2a92db5d250.png" width="600">

- 구글링을 해보니 오류의 문제파악이 어긋났다는걸 알았다. nib 파일로 만든 tableview cell 을 제대로 연결해주지 못해서 cell 을 초기화할 수 없어서 옵셔널 관련 에럭 나왔다는 것을 알았다.
```swift
//nib 파일이 들어갈 파라미터에 customcell 의 클래스이름을 넣어주었던 것이 잘못.
self.tableView.register(myTableViewCellNib, forCellReuseIdentifier: CustomCell.identifier)
```
- 출처ㅣ https://stackoverflow.com/questions/35577413/fatal-error-found-nil-while-loading-stock-tableview

## 오류2
- 아래와 같이 constraint 가 아래가 지정되지 않아 tableview 의 automaticDimension 을 사용하면 잘렸다.
<p>
<img src ="https://user-images.githubusercontent.com/69136340/107152306-8ca65580-69aa-11eb-8e3a-11b283f5884c.png" width="200">
<img src = "https://user-images.githubusercontent.com/69136340/107152220-04c04b80-69aa-11eb-9614-b8acc7c463ce.png" width="600">
</p>

- 아래의 constraint를 넣어주니 다보이게 되었다.

- 출처ㅣ https://www.hackingwithswift.com/forums/ios/uitableview-automatic-row-height-programatically/2203

## 완성
<img src="https://user-images.githubusercontent.com/69136340/107152473-7220ac00-69ab-11eb-8c79-9613d112effe.png" width="300">

### 출처
- 튜토리얼ㅣ https://duwjdtn11.tistory.com/557
