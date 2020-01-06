# Catalog app bloc

## Улучшенная версия предыдущего [варианта][CatalogAppOld]

![icon catalog app][IconCatalogApp] 

Представленная версия является усовершенствованной предыдущей версии приложения основанной на [старой версии архитектуры][GitHubCatalogApp]. Основное отличие залючается в смене методологии контроля состояний в виджетах переход от interactor к BLoC.

<details>
 <summary>Список всего что было сделано</summary>
 
  1. Авторизация. Вход возможен при вводе любых строк, кроме пустых строк;
  2. В приложении сведены к минимуму резкие переходы, поэтому есть лоадеры, fade-эффект, даже для отсутвующих данных, например пуста корзина, предусмотрена соответвующая вёрсткая;
  3. Запись/чтение данных shared preferences;
  4. Заполнение данными приложение. У нас ведь каталог товаров, реализованы следующие варинты аполнения каталоа: сгенерировать полностью товары локально, с использованием API для получения строк с описанием товара, полноценное получение товаров из REST API;
  5. Изображения для товаров сначала грузились из ассетов, а потом уже из прекрасного интернета, с последующим кэшированием;
  6. Кэширование получаемого товара. Реализован упрощённый, если определённая таблица пуста, значит надо заполнить товарами и потом данные брать оттуда. По началу товары локально генерировались, а потом с сервера поступали.
  7. Добавление в корзину товаров.
  8. Синхронизация отображаемого в корзине и БД. Если пользователь закроет приложение, то его данные не потярются.
  9. Итоговоя сумма набранных в корзине товаров отображается на всех экранах кроме авторизации. Реализовано с помощью Stream;
  10. Диалоговые окна используются в приложении, например: добавление, удаление товаров, обработке исключени;
  11. Есть обработка Exception. В приложении реализована авторская ситема "орёл/решка" - при входе в на экран каталога после авторизации с вероятностью 50% получить диалоговое с шуточным сообщением "Сегодня не ваш день. Пробуйте завтра" или перейти на экран на кталаога. В случае неудачи можно нажать на  кнопку "Повторить";
  12. У товаров есть галлерея;
  13. У товаров есть продавец с краткой информацией;
  14. Есть смена темы;
  15. Переход на BLoC;
  16. У приложения есть своя иконка;
  17. Реализован только 1 вариант вёрстки;
  18. Адаптивная вёрстка;
  19. Невозможно изменить вертикальную ориентацию. Реализован 1 вариант вёрстки - пришлось заблокировать смену ориантации, иначе бы парочка  новых багов появилась и внешний вид ухудшился бы;
  20. Исправление мелких багов, которые негативно влияли UI. С точки зрения логики всё было написано ещё в [предыдущей версии][CatalogAppOld].
  21. Присутсвует несколько интеграций со сторонним REST API
  
  |Сервис|Цель|
  |------|----|
  |[fish-text.ru][FishTextApi]|Название, описание товара|
  |[loremapi.org][LoremApi]|Название, описание товара|
  |[mockable.io][MockableIO]|Аналог сервера c REST API|
  |[lorempixel.com][LoremPrixel]|Источник картинок|

</details> 

Приложение является подобием мобильной версии интернет магазина. После игрушечной авторизации пользователь попадает на экран с каталогом товаров, откуда пользователь может отправится на любой другой экран приложения.

<details>
    <summary>Полная версия демо</summary>
                                
   ![full demo][FullDemo]
</details>

Доступные сценарии можно разделить на следующие части:
1) Авторизация. Для входа  можно ввести что угодно. Логин, пароль записываются в shared preferences, а логин используется в автарке в drawer.

<details>
    <summary>Login/logout полная версия демо</summary>
                                
   ![full login logout demo][FullLoginLogoutDemo]
</details>

<details>
    <summary>Login демо</summary>
                                
   ![short login demo][ShortLoginDemo]
</details>

<details>
    <summary>Logout демо</summary>
                                
   ![short logout demo][ShortLogoutDemo]
</details>

2) Drawer(боковое выезжающееменю на треть экрана). Сверху отображается автарка с первой буква логина введённого при
 входе. Ниже доступны кнопки: logout, смена темы приложения.

<details>
    <summary>Демо</summary>
                                
   ![drawer demo][DrawerDemo]
</details>

3) Корзина. Из каталога или детальной страницы товара возможно добавление в корзину. Во время добавления в корзину
 уточняется количество товара, а содержимое корзины записывается в бд для восстановления после закрытия приложения. 

<details>
    <summary>Демо тёмной версии</summary>
                                
   ![black cart demo][BlackCartDemo]

</details>

<details>
    <summary>Демо светлой версии</summary>
                                
   ![White cart demo][WhiteCartDemo]

</details>
4) Детальная страница товара. На странице товара доступна его покупка.

<details>
    <summary>Демо тёмной версии</summary>
                                
   ![black detail item demo][BlackDetailItemDemo]

</details>


<details>
    <summary>Демо светлой версии</summary>
                                
   ![white detail item demo][WhiteDetailItemDemo]

</details>

5) Галлерея на странице товара. 
<details>
    <summary>Демо тёмной версии</summary>
                                
   ![black gallery item demo][BlackGalleryDemo]

</details>

<details>
    <summary>Демо светлой версии</summary>
                                
   ![white gallery item demo][WhiteGalleryDemo]

</details>

6) Фоновый режим и смена темы 

<details>
    <summary>Демо</summary>
                                
   ![foreground demo][ForegroundDemo]

</details>

## Скриншоты

<details>
  <summary>Куча картинок</summary>


![black start screen][BlackStartScreen]

![white start screen][WhiteStartScreen]

![black invalid start screen][BlackInvalidStartScreen]

![white invalid start screen][WhiteInvalidStartScreen]

![black catalog screen][BlackCatalogScreen]

![white catalog screen][WhiteCatalogScreen]

![black drawer][BlackDrawer]

![white drawer][WhiteDrawer]

![black choose count dialog][BlackChooseCountDialog]

![white choose count dialog][WhiteChooseCountDialog]

![black cart screen][BlackCartScreen]

![white cart screen][WhiteCartScreen]

![black cart screen empty][BlackCartScreenEmpty]

![white cart screen empty][WhiteCartScreenEmpty]

![black item screen][BlackItemScreen]

![white item screen][WhiteItemScreen]

![black app in background][BlackAppInBackground]

![white app in background][WhiteAppInBackground]
</details>

## [Список всех моих проектов][ListAllMyProject]

License
----

MIT

**Free Software, Hell Yeah!**

   [ListAllMyProject]:<https://github.com/iebrosalin/all_public_projects>
   [ProgressiveMobile]:<http://pmobi.ru/>
   [GitHubCatalogApp]:<https://github.com/iebrosalin/catalog_app/>
   [MockableIO]:<https://www.mockable.io/>
   [BlocReference]:<https://pub.dev/packages/flutter_bloc>
   [LoremApi]:<https://loremipsum.wiegertschouten.nl>
   [FishTextApi]:<https://fish-text.ru>
   [LoremPrixel]:<http://lorempixel.com/>

   [FullDemo]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/catalog_app/bloc/descriptions/gif/full_app_demo.gif>

   [FullLoginLogoutDemo]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/catalog_app/bloc/descriptions/gif/login_logout/full_login_and_logout_demo.gif>
   [ShortLoginDemo]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/catalog_app/bloc/descriptions/gif/login_logout/short_login_demo.gif>
   [ShortLogoutDemo]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/catalog_app/bloc/descriptions/gif/login_logout/short_logout_demo.gif>

   [DrawerDemo]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/catalog_app/bloc/descriptions/gif/drawer_demo.gif>

   [BlackCartDemo]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/catalog_app/bloc/descriptions/gif/cart/black_cart_demo.gif>
   [WhiteCartDemo]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/catalog_app/bloc/descriptions/gif/cart/white_cart_demo.gif>

   [BlackDetailItemDemo]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/catalog_app/bloc/descriptions/gif/item/black_item_demo.gif>
   [WhiteDetailItemDemo]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/catalog_app/bloc/descriptions/gif/item/white_item_demo.gif>

   [BlackGalleryDemo]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/catalog_app/bloc/descriptions/gif/gallery/black_gallery_demo.gif>
   [WhiteGalleryDemo]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/catalog_app/bloc/descriptions/gif/gallery/white_gallery_demo.gif>

   [ForegroundDemo]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/catalog_app/bloc/descriptions/gif/foreground_demo.gif>

   [BlackStartScreen]:<https://raw.githubusercontent.com/iebrosalin/mobile/master/readme/flutter/catalog_app/bloc/descriptions/screens/black_start_screen.jpeg>
   [WhiteStartScreen]:<https://raw.githubusercontent.com/iebrosalin/mobile/master/readme/flutter/catalog_app/bloc/descriptions/screens/white_start_screen.jpg>
   [BlackInvalidStartScreen]:<https://raw.githubusercontent.com/iebrosalin/mobile/master/readme/flutter/catalog_app/bloc/descriptions/screens/black_invalid_start_screen.jpg>
   [WhiteInvalidStartScreen]:<https://raw.githubusercontent.com/iebrosalin/mobile/master/readme/flutter/catalog_app/bloc/descriptions/screens/white_invalid_start_screen.jpg>
   [BlackCatalogScreen]:<https://raw.githubusercontent.com/iebrosalin/mobile/master/readme/flutter/catalog_app/bloc/descriptions/screens/black_catalog_screen.jpg>
   [WhiteCatalogScreen]:<https://raw.githubusercontent.com/iebrosalin/mobile/master/readme/flutter/catalog_app/bloc/descriptions/screens/white_catalog_screen.jpg>
   [BlackDrawer]:<https://raw.githubusercontent.com/iebrosalin/mobile/master/readme/flutter/catalog_app/bloc/descriptions/screens/black_drawer.jpg>
   [WhiteDrawer]:<https://raw.githubusercontent.com/iebrosalin/mobile/master/readme/flutter/catalog_app/bloc/descriptions/screens/white_drawer.jpg>
   [BlackChooseCountDialog]:<https://raw.githubusercontent.com/iebrosalin/mobile/master/readme/flutter/catalog_app/bloc/descriptions/screens/black_choose_count_dialog.jpg>
   [WhiteChooseCountDialog]:<https://raw.githubusercontent.com/iebrosalin/mobile/master/readme/flutter/catalog_app/bloc/descriptions/screens/white_choose_count_dialog.jpg>
   [WhiteCartScreen]:<https://raw.githubusercontent.com/iebrosalin/mobile/master/readme/flutter/catalog_app/bloc/descriptions/screens/white_cart_screen.jpg>
   [BlackCartScreen]:<https://raw.githubusercontent.com/iebrosalin/mobile/master/readme/flutter/catalog_app/bloc/descriptions/screens/black_cart_screen.jpg>
   [WhiteCartScreenEmpty]:<https://raw.githubusercontent.com/iebrosalin/mobile/master/readme/flutter/catalog_app/bloc/descriptions/screens/white_cart_screen_empty.jpg>
   [BlackCartScreenEmpty]:<https://raw.githubusercontent.com/iebrosalin/mobile/master/readme/flutter/catalog_app/bloc/descriptions/screens/black_cart_screen_empty.jpg>
   [BlackItemScreen]:<https://raw.githubusercontent.com/iebrosalin/mobile/master/readme/flutter/catalog_app/bloc/descriptions/screens/black_item_screen.jpg>
   [WhiteItemScreen]:<https://raw.githubusercontent.com/iebrosalin/mobile/master/readme/flutter/catalog_app/bloc/descriptions/screens/white_item_screen.jpg>
   [BlackAppInBackground]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/catalog_app/bloc/descriptions/screens/dark_app_in_background.jpg>
   [WhiteAppInBackground]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/catalog_app/bloc/descriptions/screens/light_app_in_background.jpg>

   [IconCatalogApp]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/catalog_app/bloc/descriptions/icons/icon.png>
   [CatalogAppOld]:<https://github.com/iebrosalin/mobile/tree/flutter/catalog_app/old>
