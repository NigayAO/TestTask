# TestTask

ТЗ к заданию:
В качестве тестового задания предлагается создать небольшое приложение, позволяющее:
получать с сервера json-файл cо списком данных нескольких типов (ex: картинка, блок текста, селектор одного варианта из N) и списком кого, какие блоки данных и в каком порядке надо отобразить.
отображать список указанных элементов, и, при клике на них (или выборе одного из вариантов ответа), выводить информацию, что за объект инициировал событие (например: id, имя)
Ссылка на JSON-файл:   https://pryaniky.com/static/json/sample.json (data - данные, view - что и в каком порядке выводить)
Используемый язык: Swift
Предпочтительный паттерн при реализации приложения: MVVM
Навык использования Pods (Moya, Alamofire, Kingfisher и т.п.) будет плюсом.
Знакомство с RxSwift будет плюсом
Задание присылайте сюда, на хх в переписку, ссылкой на гитхаб).

Приложение состоит из 4 вью:
1 - TableViewController он же главный экран на котором отобразил "view - что и в каком порядке выводить";
![Simulator Screen Shot - iPod touch (7th generation) - 2022-05-27 at 17 30 57](https://user-images.githubusercontent.com/60488219/170721380-6c6cdf00-2a1b-4a43-80d3-e02bba4bd169.png)
2 - AlertController на нем отобразил data в котором было меньше информации;
![Simulator Screen Shot - iPod touch (7th generation) - 2022-05-27 at 17 31 05](https://user-images.githubusercontent.com/60488219/170721420-7450c8a6-622c-4a89-9b31-b44c88992aa6.png)
3 - ViewController здесь картинка и подпись;
![Simulator Screen Shot - iPod touch (7th generation) - 2022-05-27 at 17 32 24](https://user-images.githubusercontent.com/60488219/170721494-26e49cc2-33a6-4979-99ba-da829d2b4e37.png)
4 - Снова TableViewController в котором показал data с вариантами.
![Simulator Screen Shot - iPod touch (7th generation) - 2022-05-27 at 17 31 08](https://user-images.githubusercontent.com/60488219/170721584-556beff3-312f-4a7f-808d-156a272cdd33.png)

Примечание:
* По ТЗ применил MVVM паттерн;
* Верстал интерфейс как кодом так и в Storyboard используя Autolayout;
* Для работы с сетью использовал Alamofire;
