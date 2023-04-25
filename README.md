# Приложение - Напоминалка о Дне Рождении
Ниже представлены скриншоты моего приложения на Swift (UIKit):


<img width="245" alt="Снимок экрана 2023-04-25 в 17 59 33" src="https://user-images.githubusercontent.com/122968178/234322724-b8a73f23-5829-4ff2-b3e1-4f535c6ecbe7.png">       <img width="245" alt="Снимок экрана 2023-04-25 в 18 00 45" src="https://user-images.githubusercontent.com/122968178/234323175-8990bee8-f0c9-464e-b9f9-86e035e83435.png">   <img width="245" alt="Снимок экрана 2023-04-25 в 17 59 52" src="https://user-images.githubusercontent.com/122968178/234323280-e79d9d24-502c-426a-a2dc-e2a7014a72c4.png">    <img width="245" alt="Снимок экрана 2023-04-25 в 18 03 08" src="https://user-images.githubusercontent.com/122968178/234323384-fa37f08e-bbba-4a48-9b69-056180ad65f2.png">   <img width="245" alt="Снимок экрана 2023-04-25 в 18 06 03" src="https://user-images.githubusercontent.com/122968178/234323552-fc700081-974a-4d4c-99bd-2a5580676398.png">


## В разработке я применял:

⭐ Верстка кодом

⭐ UITableView

⭐ CoreData

⭐ UserNotifications

⭐ NSSortDescriptor

⭐ DateFormatter

⭐ Delegate

⭐ Верстка через constraints

И другие инструменты

## Краткое описание приложения:

Открывая первый раз приложение, появляется запрос на получение уведомлений от приложения.

На главном экране отображаются все добавленные Дни рождения, отсортированные в алфавитном порядке по фамилии и имени.

В верхнем правом углу расположена кнопка “+”, нажав на нее открывается контроллер, на котором Вы можете добавить имя, фамилию и дату рождения человека.

Нажав кнопку “Save”, день рождение добавляется в CoreDate, появляется на главном экране и добавляется уведомление.

Когда наступит чей то день рождения, приложение пришлет уведомление в виде сплывающего уведомления и звукового сигнала.

Если потянуть за день рождения влево, то его можно удалить. День рождение пропадет из списка на главном экране, удалится из CoreDate и уведомление будет отключено.