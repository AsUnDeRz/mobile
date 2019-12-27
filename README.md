# Catalog app bloc (Flutter 1.12)

Первый проект на Flutter. Учебное приложение, которое было написано в первые несколько недель работы в [Progressive Mobile][ProgressiveMobile]. Основной его целью было научиться основным практикам/приёмам, существующих в организации перед тем как присоеденятся к боевому проекту.

>Представленная версия является усовершенствованной предыдущей версии приложения основанной на [старой версии архитектуры][GitHubCatalogApp]. Основное отличие залючается в смене методологии контроля состояний в виджетах переход от interactor к BLoC.

Приложение является подобием мобильной версии интернет магазина. После игрушечной авторизации пользователь попадает на экран с каталогом товаров, откуда пользователь может отправится на любой другой экран приложения. Доступные сценарии можно разделить на следующие части:
1) Авторизация. Для входа  можно ввести что угодно, а внизу можно сменить тему приложения. Логин, пароль записываются в shared preferences, а логин используется в автарке в drawer. [Видео][]

![auth demo][AuthDemo]

2) Drawer(боковое выезжающееменю на треть экрана). Сверху отображается автарка с первой буква логина введённого при входе. Ниже доступны кнопки: logout, смена темы приложения.

![drawer demo][DrawerDemo]

3) Корзина. Из каталога или детальной страницы товара возможно добавление в корзину. Во время добавления в корзину уточняется количество товара, а содержимое корзины записывается в бд для восстановления после закрытия приложения.

![cart demo][CartDemo]

4) Детальная страница товара. На странице товара доступна его покупка.

![detail item demo][DetailItemDemo]

5) Галлерея на странице товара.

![detail item demo][DetailItemDemo]

# Ключевые особенности
  - Clean архитектура.
  - [BLoC][BlocReference].
  - Серверную часть эмулирует сервис [mockable.io][MockableIO].
  - Кэширование получаемой загружаемого каталога товаров из Mockable в SQLite.
  - Используются Stream для реализации динамической смена темы приложения, корзины.
  - Запись в shared preferences логина, пароля, типа темы приложения.
  - Присутсвует несколько интеграций со сторонним REST Api заполнение описаний, названий товаров, получение случайных картинок. Пока не было интеграции с Mockable локально генерировались товары, продавцы, а к товарам заголовок и описания брались из других Api: [fish-text.ru][FishTextApi], [loremapi.org][LoremApi].


## Screenshots

<details>
  <summary>Куча картинок</summary>
![black start screen][BlackStartScreen]

![white start screen][WhiteStartScreen]

![black invalid start screen][BlackInvalidStartScreen]

![white invalid start screen][WhiteInvalidStartScreen]

![black catalog screen][BlackCatalogScreen]

![white catalog screen][WhiteCatalogScreen]

![black drawer][BlackDrawer]![white drawer][WhiteDrawer]

![black choose count dialog][BlackChooseCountDialog]

![white choose count dialog][WhiteChooseCountDialog]

![black cart screen][BlackCartScreen]

![white cart screen][WhiteCartScreenNotEmpty]

![black cart screen empty][BlackCartScreenEmpty]

![white cart screen empty][WhiteCartScreen]

![black item screen][BlackItemScreen]

![white item screen][WhiteItemScreen]

![app in background][AppInBackground]
</details>


License
----

MIT

**Free Software, Hell Yeah!**

   [ProgressiveMobile]:<http://pmobi.ru/>
   [GitHubCatalogApp]:<https://github.com/iebrosalin/catalog_app/>
   [MockableIO]:<https://www.mockable.io/>
   [AuthDemo]:<https://github.com/iebrosalin/catalog_app_bloc/blob/master/descriptions/gif/demo_login.gif>
   [DrawerDemo]:<https://github.com/iebrosalin/catalog_app_bloc/blob/master/descriptions/gif/demo_logout.gif>
   [CartDemo]:<https://github.com/iebrosalin/catalog_app_bloc/blob/master/descriptions/gif/demo_cart%20.gif>
   [DetailItemDemo]:<https://github.com/iebrosalin/catalog_app_bloc/blob/master/descriptions/gif/demo_item_page.gif>
   [GalleryDemo]:<https://github.com/iebrosalin/catalog_app_bloc/blob/master/descriptions/gif/gallery_demo.gif>
   [BlocReference]:<https://pub.dev/packages/flutter_bloc>
   [LoremApi]:<https://loremipsum.wiegertschouten.nl>
   [FishTextApi]:<https://fish-text.ru>

   [BlackStartScreen]:<https://github.com/iebrosalin/catalog_app_bloc/blob/master/descriptions/black_start_screen.jpeg>
   [WhiteStartScreen]:<https://github.com/iebrosalin/catalog_app_bloc/blob/master/descriptions/white_start_screen.jpeg>
   [BlackInvalidStartScreen]:<https://github.com/iebrosalin/catalog_app_bloc/blob/master/descriptions/black_invalid_start_screen.jpeg>
   [WhiteInvalidStartScreen]:<https://github.com/iebrosalin/catalog_app_bloc/blob/master/descriptions/white_invalid_start_screen.jpeg>
   [BlackCatalogScreen]:<https://github.com/iebrosalin/catalog_app_bloc/blob/master/descriptions/black_catalog_screen.jpeg>
   [WhiteCatalogScreen]:<https://github.com/iebrosalin/catalog_app_bloc/blob/master/descriptions/white_catalog_screen.jpeg>
   [BlackDrawer]:<https://github.com/iebrosalin/catalog_app_bloc/blob/master/descriptions/black_drawer.jpeg>
   [WhiteDrawer]:<https://github.com/iebrosalin/catalog_app_bloc/blob/master/descriptions/white_drawer.jpeg>
   [BlackChooseCountDialog]:<https://github.com/iebrosalin/catalog_app_bloc/blob/master/descriptions/black_choose_count_dialog.jpeg>
   [WhiteChooseCountDialog]:<https://github.com/iebrosalin/catalog_app_bloc/blob/master/descriptions/white_choose_count_dialog.jpeg>
   [WhiteCartScreen]:<https://github.com/iebrosalin/catalog_app_bloc/blob/master/descriptions/white_cart_screen.jpeg>
   [BlackCartScreen]:<https://github.com/iebrosalin/catalog_app_bloc/blob/master/descriptions/black_cart_screen.jpeg>
   [WhiteCartScreenNotEmpty]:<https://github.com/iebrosalin/catalog_app_bloc/blob/master/descriptions/white_cart_screen_not_empty.jpeg>
   [BlackCartScreenEmpty]:<https://github.com/iebrosalin/catalog_app_bloc/blob/master/descriptions/black_cart_screen_empty.jpeg>
   [BlackItemScreen]:<https://github.com/iebrosalin/catalog_app_bloc/blob/master/descriptions/black_item_screen.jpeg>
   [WhiteItemScreen]:<https://github.com/iebrosalin/catalog_app_bloc/blob/master/descriptions/white_item_screen.jpeg>
   [AppInBackground]:<https://github.com/iebrosalin/catalog_app_bloc/blob/master/descriptions/app_in_background.jpeg>























