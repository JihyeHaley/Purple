## :green_book: day3_ 20200513

I, Haley, feel really sorry to all...



Thanks to all to give me my own time to take course.

Be honest to try my best from tomorrow. 



I cannot figure out the things I cannot do through R crawling. 

Especially, I made code to crawl `img` tag, but because of things that does not have `img` tag, R has been occurring errors and let the Selinum stopped. I many times started to use TryCatch, if , for, try. But it does not work.



My conclusion today is that i will stop to find Elements of that at the moment, and focus on other activity!





## :green_book: day8_20200518

gs 매장명, 주소, 전화번호 크롤링 - 일부 append 오류로 ***day9에 오전에 다시 수집 필요***

event.jsp 담당

style_event.css 수정 

visual studio code, eclipse모두 사용 

##### 내일 할일(day9_ 20200519) 

1. gs 매장명, 주소, 전화번호 크롤링
2. data-filter 정리해서 사진 링크로 보내는 것 구현하기



## :green_book: day9_20200519

오늘은 너무 긴 하루였다..!

R에  괄호 잘 닫아줬는데도, 말을 듣지 않고 오류를 발생시키고 크롤링이 멈춘다...

내가 더 잘해야해지.. ㅠㅠ

오늘 한 일 

- Search 기능 구현

내일 할 일 

* 크롤링 정제
* 상품 아이디 넣어서
* DAO로 mvc 준비해서 만들기



## :green_book: day10_20200520

**shope_code** 은 full join 해서 가져오기

```sql
select shop_code
from GOODS
left outer join GOODS_SHOP on GOODS_SHOP.GOOD_ID = GOODS.GOOD_ID;
```

**good_img, good_name, mfg_name, good_price **은 full join 해서 가져오기

```sql
select good_img, good_name, mfg_name, good_price
from EVENT
LEFT outer join GOODS on EVENT.good_id = GOODS.good_id;
```

**event_name**

```sql
select event_name
from EVENT
left outer join GOODS on EVENT.GOOD_ID = GOODS.GOOD_ID;
```



## :green_book: day13_20200523 

꿈속에서도 코딩을한다..ㅎㅎ 

View 가 잘 안되ㄴ서  form 태그 계속 수정수정 ㅎㅎㅎ