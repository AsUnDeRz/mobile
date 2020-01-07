# Social network

 За середину октября в плоть до конца декабря я накопил достаточно опыта, впечатлений для следующего 
 пет-проекта. Представьте себе интсаграмм, тик-ток и вы не сильно ошибётесь. Там поле непаханное
 задач: UX, мобильный бек, синхронизация с беком, реал-тайм (чаты, сессии...).
 
 В текущей версии сконцентрировался на решении UX-задач для экрана ленты новостей.

## Демо

Пока готова лента новостей. Это не окончательный вариант, если ещё буду разрабатывать на Flutter, то всё же сделаю переключение вариантов экранов. Есть разные варианты и код для их реализации было бы удобно складировать с помощью этого механизма.

<details>
 <sumary>Демо запуска приложения</summary>
 
 ![StartDemo][StartDemo]
</details> 

<details>
 <sumary>Демо шапки и футера поста</summary>
 
 ![HeaderFooterPostDemo][HeaderFooterPostDemo]
</details> 
 
<details>
 <sumary>Демо быстрого листания</summary>
 
 ![FastSnappingDemo][FastSnappingDemo]
</details> 
  
<details>
 <sumary>Демо ошибки при загрузке изображения поста</summary>
 
 ![ErrorPost][ErrorPostDemo]
</details>
   
<details>
 <sumary>Демо drawer и фоновой иконки</summary>
 
 ![DrawerBackground][DrawerBackground]
</details>
 
 <details>
 <sumary>Скриншоты</summary>
 
 ![Screen1][Screen1]
 ![Screen2][Screen2]
 ![Screen3][Screen3] 
 ![Screen4][Screen4] 
 ![Screen5][Screen5] 
 ![Screen6][Screen6]
</details>
 
# Немного макетов

[Исходный файл макета][MaketLink]

 - Экран лента новостей
    <details>
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
    
    <details>
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
       
        <details>
           <summary>Свой профиль</summary>
             
        ![ProfileDark1][ProfileDarkOwn]
          
        ![ProfileDark2][ProfileDarkOwn2]
      
       </details>
      
        <details>
           <summary>Чужой профиль</summary>
             
         ![ProfileDark3][ProfileDarkOther]
              
         ![ProfileDark4][ProfileDarkOther2]
        </details>  
     
    - Светлая версия
      
       <details>
           <summary>Свой профиль</summary>
             
        ![ProfileLight1][ProfileLightOwn]
              
        ![ProfileLight2][ProfileLightOwn2]
       </details> 
      
      <details>
          <summary>Чужой профиль</summary>
          
       ![ProfileLight3][ProfileLightOther]
         
       ![ProfileLight4][ProfileLightOther2]
      </details> 
  
  - Экран редактирования профиля
    
    <details>
      <summary>Тёмная версия</summary>
         
       ![edit profile dark 1][EditProfileDark1]
         
       ![edit profile dark 2][EditProfileDark2]
    </details>  
    
    <details>
      <summary>Светлая версия</summary>
         
       ![edit profile light 1][EditProfileLight1]
       
       ![edit profile light 2][EditProfileLight2]
    </details> 

 - Экран списка подписок/подписчиков
     
    <details>
      <summary>Тёмная версия</summary>
          
      ![subscription dark 1][SubscriptionDark1]
        
      ![subscription dark 2][SubscriptionDark2]
     </details>  
     
     <details>
        <summary>Светлая версия</summary>
          
      ![subscription light 1][SubscriptionLight1]
        
      ![subscription light 2][SubscriptionLight2]
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


[StartDemo]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/gif/start.gif>
[HeaderFooterPostDemo]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/gif/header_footer_post.gif>
[FastSnappingDemo]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/gif/fast%20snapping.gif>
[ErrorPostDemo]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/gif/error_post.gif>
[DrawerBackground]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/gif/drawer_background.gif>

[Screen1]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/screenshots/post.jpg>
[Screen2]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/screenshots/expanded%20post.jpg>
[Screen3]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/screenshots/drawer.jpg>
[Screen4]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/screenshots/load_post.jpg>
[Screen5]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/screenshots/error%20post.jpg>
[Screen6]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/screenshots/background.jpg>

[MaketLink]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/maket.drawio>

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
[ProfileLightOwn2]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/light/profile/dark/own.png>
[ProfileLightOther]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/light/profile/light/other.png>
[ProfileLightOther2]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/light/profile/dark/other.png>

[EditProfileDark1]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/dark/edit_profile/edit_profile_1.png>
[EditProfileDark2]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/dark/edit_profile/edit_profile_2.png>

[EditProfileLight1]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/light/edit_profile/edit_profile_1.png>
[EditProfileLight2]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/light/edit_profile/edit_profile_2.png>

[SubscriptionDark1]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/dark/subscription/subscription_1.png>
[SubscriptionDark2]:<https://raw.githubusercontent.com/iebrosalin/mobile/master/readme/flutter/social_network/unpublish/dark/subscription/subscription_2.png>

[SubscriptionLight1]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/light/subscription/subscription_1.png>
[SubscriptionLight2]:<https://github.com/iebrosalin/mobile/blob/master/readme/flutter/social_network/unpublish/light/subscription/subscription_2.png>
