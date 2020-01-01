# Social network

 За пару месяцев работы в режиме жизнь-код я накопил достаточно опыта, впечатлений для следующего 
 пет-проекта. Представьте себе интсаграмм, тик-ток и вы не сильно ошибётесь. Там поле непаханное с 
 UX-задачами, не смотря на то что почти каждый является потребителем подобного контента. 

 Немного макетов
 - Экран лента новостей
   
   Каждая новость занимает весь экран (переход свайпами верх). Имеет
   фото/видео, дату создания, автора. 

    - <details>
        <summary>Демо тёмная версия</summary>
     
         ![FlowDark1][FlowDark1]
         
         ![FlowDark2][FlowDark2]
         
         ![FlowDark3][FlowDark3]
         
         ![FlowDark4][FlowDark4]
         
         ![FlowDark5][FlowDark5]
         
         ![FlowDark6][FlowDark6]
         
         ![FlowDark7][FlowDark7]
         
         ![FlowDark8][FlowDark8]
         
         ![FlowDark9][FlowDark9]
         
         ![FlowDark10][FlowDark10]
         
         ![FlowDark11][FlowDark11]
         
         ![FlowDark12][FlowDark12]
         
         ![FlowDark12][FlowDarkAlt13]
         
         ![FlowDark12][FlowDarkAlt14]  
         
    </details>
    
    - <details>
       <summary>Светлая версия</summary>
       
         ![FlowLight1][FlowLight1]     
           
         ![FlowLight2][FlowLight2]   
              
         ![FlowLight3][FlowLight3]     
           
         ![FlowLight4][FlowLight4]   
             
         ![FlowLight5][FlowLight5]   
             
         ![FlowLight6][FlowLight6]  
              
         ![FlowLight7][FlowLight7]    
            
         ![FlowLight8][FlowLight8]    
            
         ![FlowLight9][FlowLight9]     
           
         ![FlowLight10][FlowLight10]   
             
         ![FlowLight10][FlowLight11]   
             
         ![FlowLight11][FlowLightAlt12]  
         
         ![FlowLight12][FlowLightAlt13]  
    </details>   

 
 - Экран профиля
 
    - Тёмная версия
       
        - <details>
           <summary>Свой профиль</summary>
             
            ![ProfileDark1][ProfileDarkOwn]
          
            ![ProfileDark2][ProfileDarkOwn2]
      
       </details>
      
        - <details>
           <summary>Чужой профиль</summary>
             
            ![ProfileDark3][ProfileDarkOther]
              
            ![ProfileDark4][ProfileDarkOther2]
        </details>  
     
    - Светлая версия
      
       - <details>
           <summary>Свой профиль</summary>
             
            ![ProfileLight1][ProfileLightOwn]
              
            ![ProfileLight2][ProfileLightOwn2]
       </details> 
      
      - <details>
          <summary>Чужой профиль</summary>
          
          ![ProfileLight3][ProfileLightOther]
          
          ![ProfileLight4][ProfileLightOther2]
      </details> 
       
   - <details>
     <summary>Дополнительная информация</summary>
      
       Скролируемый экран, имеющий разные виды и поведенияв зависимости от типа 
       пользователяи (мой и чужой профиль) и поведение от наличии авторизации. Неавторизованные 
       пользователи при совершении действий требующих авторизации открывают экран авторизации.  
       Свой экран профиля содержал следующее: 
       - Автарку.
       - Текущее местоположение
          - Неавторизованный пользователь видит вымышленное местонахождение пользователя.
          - В своём профиле пользователь видит город, страну где он находится.
          - В чужом профиле город чужого пользователя и расстояние между своим пользователем и 
          просматриваемым пользователе.
       - Подарки.  В моём понимании это сообщение в чате с пользователем оформленные особенным образом.
       Эти сообщение отличаются рядом дополнительных настроек, например: цвет фона, звук при открытии подарка, 
       тема сообщения(совокупность тематических преднастроек). Если есть подарки, то иконка 
       показывается иначе нет. При клике на происходит переход на экран со списком подарков.
       - Кол-во подписок, подписчиков - кликабельны и ведут на на соответствующие страницы списки
       - В своём профиле есть бургер меню для вызова диалогового окна для выбора следующей страницы.
        Отсюда пользователь точно сможет попасть на страницу редактирования профиля пользователя, 
        также другие настройки придётся прятать тут.
       - Посты пользователя с подгрузкой по скролу. 
      </details>  

  
  - Экран редактирования профиля
    
    - <details>
      <summary>Тёмная версия</summary>
         
         ![][]
    </details>  
    
    - <details>
      <summary>Светлая версия</summary>
         
       ![][]
    </details> 
    
    - <details>
      <summary>Дополнительная информация</summary>
        
       Стандартный экран редактирования. Аватар кликабелен и вызывает диалоговое окно с выбором источника аватрки.
       Текстовые поля выполнены в стиле материал, с автовалидацией.
    </details>  

 - Экран списка подписок/подписчиков
     
    - <details>
      <summary>Тёмная версия</summary>
          
        ![][]
     </details>  
     
     - <details>
        <summary>Светлая версия</summary>
          
        ![][]
     </details> 
     
     - <details>
          <summary>Дополнительная информация</summary>
         
        Список с пагинацией по скролу. Неавторизованные пользователи при нажатии на кнопку подписатсья переходят на 
        экран авторизации. Тап по аватару переводит на профиль пользователя.
     </details>  
 
  ## Технологичесикие вызовы нового пет-проекта
  С частью задач я сталкивался и имею информации о их решении, но общее и универсальное пока не 
  найдено и не написано. Если придёт время, то придётся похоронить не один вечер на решение 
  перечисленных задач:
  - Авторизации с последующем контролем стэка экранов.
  - Внутрестраничная навигация, отказ от push-экранов, для того чтобы экран мог сам стать стеком 
  содержащийся внутри основного стека приложения. Живой пример можно увидеть в инстаграмме, он
   буквально на этом построен.
  - Алгоритм предзагрузки контента для ленты.
  - Чаты.
  - Уведомления.

[FlowDark1]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/dark/flow/main/flow_1.png>
[FlowDark2]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/dark/flow/main/flow_2.png>
[FlowDark3]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/dark/flow/main/flow_3.png>
[FlowDark4]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/dark/flow/main/flow_4.png>
[FlowDark5]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/dark/flow/main/flow_5.png>
[FlowDark6]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/dark/flow/main/flow_6.png>
[FlowDark7]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/dark/flow/main/flow_7.png>
[FlowDark8]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/dark/flow/main/flow_8.png>
[FlowDark9]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/dark/flow/main/flow_9.png>
[FlowDark10]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/dark/flow/main/flow_10.png>
[FlowDark11]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/dark/flow/main/flow_11.png>
[FlowDark12]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/dark/flow/main/flow_12.png>

[FlowDarkAlt13]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/dark/flow/alt/flow_13.png>
[FlowDarkAlt14]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/dark/flow/alt/flow_14.png>

[FlowLight1]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/light/flow/main/flow_1.png>
[FlowLight2]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/light/flow/main/flow_2.png>
[FlowLight3]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/light/flow/main/flow_3.png>
[FlowLight4]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/light/flow/main/flow_4.png>
[FlowLight5]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/light/flow/main/flow_5.png>
[FlowLight6]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/light/flow/main/flow_6.png>
[FlowLight7]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/light/flow/main/flow_7.png>
[FlowLight8]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/light/flow/main/flow_8.png>
[FlowLight9]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/light/flow/main/flow_9.png>
[FlowLight10]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/light/flow/main/flow_10.png>
[FlowLight11]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/light/flow/main/flow_11.png>
     
[FlowLightAlt12]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/light/flow/alt/flow_12.png>
[FlowLightAlt13]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/light/flow/alt/flow_13.png>

[ProfileDarkOwn]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/dark/profile/light/own.png>
[ProfileDarkOwn2]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/dark/profile/dark/own.png>
[ProfileDarkOther]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/dark/profile/dark/other.png>
[ProfileDarkOther2]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/dark/profile/light/other.png>

[ProfileLightOwn]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/light/profile/light/own.png>
[ProfileLightOwn]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/light/profile/own.png>
[ProfileLightOther]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/light/profile/other.png>
[ProfileLightOther2]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/light/profile/light/other.png>