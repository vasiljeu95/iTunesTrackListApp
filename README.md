# iTunesTrackListApp

## Краткое описание
В этом приложении вы можете искать песни в библиотеке iTunes, названия песен вводите в строку поиска. Приложение имеет лишь 1 экран. 
Используемое API для получения погодных данных: iTunes Api.
Стек основных используемых технологий: REST API, URLSession, UISearchBar, xib, MVC.

### Экран поиска: 
![alt text](https://sun9-2.userapi.com/c855416/v855416631/20aaa5/NRbn9yVzxVQ.jpg "Logo Title Text 1")

## Пример кода
1. Как я реализовал поиск с помощью таймера в экстеншене

```swift
// MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            self.networkService.fetchTrack(searchTraks: searchText) { [weak self](searchResults) in
                self?.tracks = searchResults?.results ?? []
                self?.tableView.reloadData()
            }
        })
    }
}
```

2. Как я получал данные используя в последующем замыкания

```swift
class NetworkService {
    
    func fetchTrack(searchTraks: String, completion: @escaping (SearchResponse?) -> Void) {
        
        let jsonUrl = "https://itunes.apple.com/search?term=\(searchTraks)&limit=25"
        
        guard let url = URL(string: jsonUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                let tracksProperty = try JSONDecoder().decode(SearchResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(tracksProperty)
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
```

## Что узнал нового:
* Реализовал интерфейс без storyboard
* Первый опыт работы с xib - файлами
* Первый опыт работы с UISearchBar

## Проблеммы с которыми столкнулся:
* Не сразу удалось отобразить данные на экране, данные пирходили, но не отображались. 
