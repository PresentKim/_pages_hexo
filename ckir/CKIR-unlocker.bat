@ECHO OFF
rem C萄塭檜粽煎 蛤滓饜葬 檜翕 (в熱)
cd /d C:\Windows\System32

rem 夔樂 觼晦諦 儀 撲薑
mode con cols=120 lines=30 & color 0f

rem 雖羲滲熱�� �� 滲熱 蛔煙
setlocal & set VER=v0.1.0

rem 顫檜ぎ 撲薑
title CKIR unlocker [%ver%]

:MAIN_MENU
cls
echo.
echo    旨收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收旬     @author  PresentKim (debe3721@gmail.com)
echo    早      餌檜幗 雖衝 薑爾寞 薯и п薯晦 (CKIR unlocker) [%ver%]     早     @link    https://present.kim
echo    曳收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收朽     @license MIT License
echo    早忙式式式式式式式式式式式式式式忖  忙式式式式式式式式式式式式式式忖早
echo    早弛    1. 餌檜お 薯и 婦溼     弛  弛    2. 晦棟 薯и 婦溼       弛早
echo    早戌式式式式式式式式式式式式式式戎  戌式式式式式式式式式式式式式式戎早
echo    早忙式式式式式式式式式式式式式式忖  忙式式式式式式式式式式式式式式忖早
echo    早弛    3. 擬辨 Щ煎斜極 撲纂   弛  弛    4. 晦顫 撲薑 婦溼       弛早
echo    早戌式式式式式式式式式式式式式式戎  戌式式式式式式式式式式式式式式戎早
echo    早忙式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式忖早
echo    早弛    0. 餌檜幗 雖衝 薑爾寞 薯и п薯晦 謙猿                    弛早
echo    早戌式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式戎早
echo    曲收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收旭
set /p select=殮溘:
echo.
if %select% == 1 goto :HOST_MENU
if %select% == 2 goto :UNLOCK_MENU
if %select% == 3 goto :INSTALLER_MENU
if %select% == 4 goto :ETC_MENU
if %select% == 0 goto exit
goto :MAIN_MENU


:HOST_MENU
cls
echo.
echo    旨收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收旬     @author  PresentKim (debe3721@gmail.com)
echo    早      餌檜幗 雖衝 薑爾寞 薯и п薯晦 (CKIR unlocker) [%ver%]     早     @link    https://present.kim
echo    曳收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收朽     @license MIT License
echo    早忙式式式式式式式式式式式式式式忖  忙式式式式式式式式式式式式式式忖早
echo    早弛    1. 餌檜お 薯и п薯     弛  弛    2. DNS撲薑              弛早
echo    早戌式式式式式式式式式式式式式式戎  戌式式式式式式式式式式式式式式戎早
echo    早忙式式式式式式式式式式式式式式忖  忙式式式式式式式式式式式式式式忖早
echo    早弛    3. 霜蕾 餌檜お 蹺陛     弛  弛    4. �ˊ瘋� だ橾 翮晦     弛早
echo    早戌式式式式式式式式式式式式式式戎  戌式式式式式式式式式式式式式式戎早
echo    早忙式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式忖早
echo    早弛    0. 詭檣 詭景煎 檜翕                                       弛早
echo    早戌式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式戎早
echo    曲收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收旭
set /p select=殮溘:
echo.
if %select% == 1 goto :HOST_PATH
if %select% == 2 goto :DNS_PATH
rem if %select% == 3 goto :HOST_ADD
if %select% == 4 goto :OPEN_HOST
if %select% == 0 goto :MAIN_MENU
goto :HOST_MENU


:UNLOCK_MENU
cls
echo.
echo    旨收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收旬     @author  PresentKim (debe3721@gmail.com)
echo    早      餌檜幗 雖衝 薑爾寞 薯и п薯晦 (CKIR unlocker) [%ver%]     早     @link    https://present.kim
echo    曳收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收朽     @license MIT License
echo    早忙式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式忖早
echo    早弛    1. 晦棟 薯и п薯 (煎斜螃Щ 瞪)                           弛早
echo    早戌式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式戎早
echo    早忙式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式忖早
echo    早弛    2. 晦棟 薯и п薯 (煎斜螃Щ ��)                           弛早
echo    早戌式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式戎早
echo    早忙式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式忖早
echo    早弛    0. 詭檣 詭景煎 檜翕                                       弛早
echo    早戌式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式戎早
echo    曲收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收收旭
set /p select=殮溘:
echo.
if %select% == 1 goto :UNLOCK_BEFORE
if %select% == 2 goto :UNLOCK_AFTER
if %select% == 0 goto :MAIN_MENU
goto :UNLOCK_MENU













:HOST_PATH
cls
(
  ECHO 216.58.192.35 www.google.co.kr
  ECHO 216.58.192.35 google.co.kr
  ECHO 216.58.192.35 accounts.google.co.kr
  ECHO 216.58.192.35 accounts.google.com
  ECHO 216.58.192.77 www.google.com
  ECHO 216.58.192.77 developers.google.com
  ECHO 216.58.192.77 opensource.google.com
  ECHO 216.58.192.77 dl.google.com
  ECHO 216.58.192.77 cache.pack.google.com
  ECHO 216.58.192.77 code.google.com
  ECHO 216.58.192.77 tools.google.com
  ECHO 216.58.192.77 chrome.google.com
  ECHO 216.58.192.77 update.googleapis.com
  ECHO 216.58.192.77 trends.google.com
  ECHO 216.58.192.77 trends.google.co.kr
  ECHO 216.58.192.77 google.com
  ECHO 216.58.192.77 support.google.com
  ECHO 216.58.192.77 goo.gl
  ECHO 216.58.192.77 drive.google.com
  ECHO 216.58.192.77 drivers.google.com
  ECHO 216.58.192.77 store.google.com
  ECHO 216.58.192.77 api.google.com
  ECHO 216.58.192.77 play.google.com
  ECHO 216.58.192.77 firebase.google.com
  ECHO 216.58.192.77 mail.google.com
  ECHO 216.58.192.77 docs.google.com
  ECHO 216.58.192.77 analytics.google.com
  ECHO 185.135.90.235 fonts.google.apis.com
  ECHO 216.58.192.42 fonts.googleapis.com
  ECHO 216.58.192.35 fonts.gstatic.com
  ECHO 216.58.206.14 manifest.googlevideo.com
  ECHO 216.58.192.77 translate.google.com
  ECHO 216.58.192.77 maps.google.com
  ECHO 216.58.192.77 maps.google.co.kr
  ECHO 216.58.192.77 www.maps.google.com
  ECHO 216.58.192.77 www.maps.google.co.kr
  ECHO 216.58.192.77 www.blogger.com
  ECHO 216.58.192.77 blogger.com
  ECHO 216.58.192.77 www.blogspot.com
  ECHO 216.58.192.77 blogspot.com
  ECHO 216.58.192.77 clientservices.googleapis.com
  ECHO 216.58.192.77 ssl.google-anaytics.com
  ECHO 216.58.192.77 adservice.google.co.kr
  ECHO 216.58.192.77 www.googletagmanager.com
  ECHO 216.58.192.77 safebrowsing.googleapis.com
  ECHO 216.58.192.77 clients1.google.com
  ECHO 216.58.192.77 encrypted-tbn0.gstatic.com
  ECHO 216.58.192.77 beacons.gcp.gvt2.com
  ECHO 216.58.192.77 clients4.google.co.kr
  ECHO 216.58.192.77 mwultong.blogspot.com
  ECHO 216.58.192.77 fonts.google.com
  ECHO 216.58.192.77 ajax.googleapis.com

  ECHO 74.125.28.94 ssl.gstatic.com
  ECHO 216.58.219.131 gstatic.com
  ECHO 216.58.219.131 www.gstatic.com

  ECHO 216.58.192.174 www.youtube.com
  ECHO 216.58.192.174 www.youtube.co.kr
  ECHO 216.58.192.174 youtube.com
  ECHO 216.58.192.174 youtu.be
  ECHO 216.58.192.174 youtube.co.kr
  ECHO 216.58.192.174 accounts.youtube.com
  ECHO 216.58.192.174 studio.youtube.com
  ECHO 216.58.192.174 tv.youtube.com
  ECHO 216.58.192.174 music.youtube.com
  ECHO 216.58.192.174 gaming.youtube.com
  ECHO 216.58.192.174 kids.youtube.com

  ECHO 216.58.207.46 s.ytimg.com
  ECHO 216.58.205.238 i.ytimg.com
  ECHO 216.58.205.238 i9.ytimg.com
  ECHO 216.58.197.194 yt3.ggpht.com
  ECHO 216.58.192.77 lh3.googleusercontent.com


  ECHO 13.229.188.59	github.com
  ECHO 13.250.177.223	github.com
  ECHO 52.74.223.119	github.com
  ECHO 13.229.188.59	www.github.com
  ECHO 13.250.177.223	www.github.com
  ECHO 52.74.223.119	www.github.com
  ECHO 13.229.188.59	gist.github.com
  ECHO 13.250.177.223	gist.github.com
  ECHO 52.74.223.119	gist.github.com
  ECHO 13.229.188.59	shop.github.com
  ECHO 13.250.177.223	shop.github.com
  ECHO 52.74.223.119	shop.github.com
  ECHO 13.250.94.254	api.github.com
  ECHO 13.250.168.23	api.github.com
  ECHO 54.169.195.247	api.github.com
  ECHO 13.229.189.0	codeload.github.com
  ECHO 13.250.162.133	codeload.github.com
  ECHO 54.251.140.56	codeload.github.com
  ECHO 13.250.183.169	assets.github.com
  ECHO 13.250.186.164	assets.github.com
  ECHO 13.250.195.152	assets.github.com

  ECHO 93.184.215.201	download.visualstudio.microsoft.com
  ECHO 104.244.46.167	abs.twimg.com
  ECHO 104.244.46.231	abs.twimg.com
  ECHO 117.18.237.66	platform.twitter.com
  ECHO 117.18.237.70	pbs.twimg.com

  ECHO 74.125.24.17 gmail.com
  ECHO 74.125.24.18 gmail.com
  ECHO 74.125.24.19 gmail.com
  ECHO 74.125.24.83 gmail.com
  ECHO 74.125.24.17 www.gmail.com
  ECHO 74.125.24.18 www.gmail.com
  ECHO 74.125.24.19 www.gmail.com
  ECHO 74.125.24.83 www.gmail.com
  ECHO 74.125.24.17 mail.google.com
  ECHO 74.125.24.18 mail.google.com
  ECHO 74.125.24.19 mail.google.com
  ECHO 74.125.24.83 mail.google.com
  ECHO 74.125.24.84 accounts.google.com
  ECHO 74.125.24.91 dl.google.com
  ECHO 74.125.24.93 dl.google.com
  ECHO 74.125.24.136 dl.google.com
  ECHO 74.125.24.190 dl.google.com
  ECHO 74.125.24.91 safebrowsing.google.com
  ECHO 74.125.24.93 safebrowsing.google.com
  ECHO 74.125.24.136 safebrowsing.google.com
  ECHO 74.125.24.190 safebrowsing.google.com
  ECHO 74.125.24.91 sb-ssl.google.com
  ECHO 74.125.24.93 sb-ssl.google.com
  ECHO 74.125.24.136 sb-ssl.google.com
  ECHO 74.125.24.190 sb-ssl.google.com
  ECHO 74.125.24.91 youtube.com
  ECHO 74.125.24.93 youtube.com
  ECHO 74.125.24.136 youtube.com
  ECHO 74.125.24.190 youtube.com
  ECHO 74.125.24.91 www.youtube.com
  ECHO 74.125.24.93 www.youtube.com
  ECHO 74.125.24.136 www.youtube.com
  ECHO 74.125.24.190 www.youtube.com
  ECHO 74.125.24.91 artists.youtube.com
  ECHO 74.125.24.93 artists.youtube.com
  ECHO 74.125.24.136 artists.youtube.com
  ECHO 74.125.24.190 artists.youtube.com
  ECHO 74.125.24.91 tv.youtube.com
  ECHO 74.125.24.93 tv.youtube.com
  ECHO 74.125.24.136 tv.youtube.com
  ECHO 74.125.24.190 tv.youtube.com
  ECHO 74.125.24.91 youtu.be
  ECHO 74.125.24.93 youtu.be
  ECHO 74.125.24.136 youtu.be
  ECHO 74.125.24.190 youtu.be
  ECHO 74.125.24.94 id.google.com
  ECHO 74.125.24.94 clientservices.googleapis.com
  ECHO 74.125.24.94 update.googleapis.com
  ECHO 74.125.24.94 gstatic.com
  ECHO 74.125.24.120 gstatic.com
  ECHO 74.125.24.94 www.gstatic.com
  ECHO 74.125.24.120 www.gstatic.com
  ECHO 74.125.24.94 csi.gstatic.com
  ECHO 74.125.24.120 csi.gstatic.com
  ECHO 74.125.24.94 fonts.gstatic.com
  ECHO 74.125.24.94 maps.gstatic.com
  ECHO 74.125.24.120 maps.gstatic.com
  ECHO 74.125.24.94 ssl.gstatic.com
  ECHO 74.125.24.94 recaptcha.net
  ECHO 74.125.24.94 www.recaptcha.net
  ECHO 74.125.24.94 google.co.kr
  ECHO 74.125.24.94 www.google.co.kr
  ECHO 74.125.24.94 accounts.google.co.kr
  ECHO 74.125.24.94 id.google.co.kr
  ECHO 74.125.24.94 maps.google.co.kr
  ECHO 74.125.24.94 khms0.google.co.kr
  ECHO 74.125.24.94 khms1.google.co.kr
  ECHO 74.125.24.94 khms2.google.co.kr
  ECHO 74.125.24.94 khms3.google.co.kr
  ECHO 74.125.24.94 translate.google.co.kr
  ECHO 74.125.24.94 google.co.jp
  ECHO 74.125.24.94 www.google.co.jp
  ECHO 74.125.24.94 accounts.google.co.jp
  ECHO 74.125.24.94 translate.google.co.jp
  ECHO 74.125.24.95 analyticsinsights-pa.clients6.google.com
  ECHO 74.125.24.95 analyticssuitefrontend-pa.clients6.google.com
  ECHO 74.125.24.95 appsitemsuggest-pa.clients6.google.com
  ECHO 74.125.24.95 blobcomments-pa.clients6.google.com
  ECHO 74.125.24.95 people-pa.clients6.google.com
  ECHO 74.125.24.95 realtimesupport.clients6.google.com
  ECHO 74.125.24.95 www.googleapis.com
  ECHO 74.125.24.95 ajax.googleapis.com
  ECHO 74.125.24.95 chart.googleapis.com
  ECHO 74.125.24.95 content.googleapis.com
  ECHO 74.125.24.95 fonts.googleapis.com
  ECHO 74.125.24.95 imasdk.googleapis.com
  ECHO 74.125.24.95 incrementalwebfonts-pa.googleapis.com
  ECHO 74.125.24.95 maps.googleapis.com
  ECHO 74.125.24.95 safebrowsing.googleapis.com
  ECHO 74.125.24.95 translate.googleapis.com
  ECHO 74.125.24.95 youtube.googleapis.com
  ECHO 74.125.24.97 googletagmanager.com
  ECHO 74.125.24.97 www.googletagmanager.com
  ECHO 74.125.24.97 ssl.google-analytics.com
  ECHO 74.125.24.99 api.google.com
  ECHO 74.125.24.103 api.google.com
  ECHO 74.125.24.104 api.google.com
  ECHO 74.125.24.105 api.google.com
  ECHO 74.125.24.106 api.google.com
  ECHO 74.125.24.147 api.google.com
  ECHO 74.125.24.99 scholar.google.com
  ECHO 74.125.24.103 scholar.google.com
  ECHO 74.125.24.104 scholar.google.com
  ECHO 74.125.24.105 scholar.google.com
  ECHO 74.125.24.106 scholar.google.com
  ECHO 74.125.24.147 scholar.google.com
  ECHO 74.125.24.99 googleapis.com
  ECHO 74.125.24.103 googleapis.com
  ECHO 74.125.24.104 googleapis.com
  ECHO 74.125.24.105 googleapis.com
  ECHO 74.125.24.106 googleapis.com
  ECHO 74.125.24.147 googleapis.com
  ECHO 74.125.24.99 google-analytics.com
  ECHO 74.125.24.103 google-analytics.com
  ECHO 74.125.24.104 google-analytics.com
  ECHO 74.125.24.105 google-analytics.com
  ECHO 74.125.24.106 google-analytics.com
  ECHO 74.125.24.147 google-analytics.com
  ECHO 74.125.24.99 t0.gstatic.com
  ECHO 74.125.24.99 t1.gstatic.com
  ECHO 74.125.24.99 t2.gstatic.com
  ECHO 74.125.24.99 t3.gstatic.com
  ECHO 74.125.24.100 google.com
  ECHO 74.125.24.101 google.com
  ECHO 74.125.24.102 google.com
  ECHO 74.125.24.113 google.com
  ECHO 74.125.24.138 google.com
  ECHO 74.125.24.139 google.com
  ECHO 74.125.24.100 www.google.com
  ECHO 74.125.24.101 www.google.com
  ECHO 74.125.24.102 www.google.com
  ECHO 74.125.24.113 www.google.com
  ECHO 74.125.24.138 www.google.com
  ECHO 74.125.24.139 www.google.com
  ECHO 74.125.24.100 appspot.com
  ECHO 74.125.24.100 www.appspot.com
  ECHO 74.125.24.100 chromebook.com
  ECHO 74.125.24.100 www.chromebook.com
  ECHO 74.125.24.100 admin.google.com
  ECHO 74.125.24.100 ads.google.com
  ECHO 74.125.24.100 ampcid.google.com
  ECHO 74.125.24.100 analytics.google.com
  ECHO 74.125.24.100 apis.google.com
  ECHO 74.125.24.100 apps.google.com
  ECHO 74.125.24.100 books.google.com
  ECHO 74.125.24.100 chrome.google.com
  ECHO 74.125.24.100 chat.google.com
  ECHO 74.125.24.100 clients1.google.com
  ECHO 74.125.24.100 clients2.google.com
  ECHO 74.125.24.100 clients3.google.com
  ECHO 74.125.24.100 clients4.google.com
  ECHO 74.125.24.100 clients5.google.com
  ECHO 74.125.24.100 clients6.google.com
  ECHO 74.125.24.100 cloud.google.com
  ECHO 74.125.24.100 contacts.google.com
  ECHO 74.125.24.100 developers.google.com
  ECHO 74.125.24.100 docs.google.com
  ECHO 74.125.24.100 drive.google.com
  ECHO 74.125.24.100 earth.google.com
  ECHO 74.125.24.100 edu.google.com
  ECHO 74.125.24.100 fcmatch.google.com
  ECHO 74.125.24.100 fonts.google.com
  ECHO 74.125.24.100 get.google.com
  ECHO 74.125.24.100 gg.google.com
  ECHO 74.125.24.100 groups.google.com
  ECHO 74.125.24.100 gsuite.google.com
  ECHO 74.125.24.100 hangouts.google.com
  ECHO 74.125.24.100 keep.google.com
  ECHO 74.125.24.100 khms.google.com
  ECHO 74.125.24.100 lh2.google.com
  ECHO 74.125.24.100 lh3.google.com
  ECHO 74.125.24.100 lh4.google.com
  ECHO 74.125.24.100 lh5.google.com
  ECHO 74.125.24.100 lh6.google.com
  ECHO 74.125.24.100 maps.google.com
  ECHO 74.125.24.100 marketingplatform.google.com
  ECHO 74.125.24.100 meet.google.com
  ECHO 74.125.24.100 mt0.google.com
  ECHO 74.125.24.100 myaccount.google.com
  ECHO 74.125.24.100 news.google.com
  ECHO 74.125.24.100 notifications.google.com
  ECHO 74.125.24.100 ogs.google.com
  ECHO 74.125.24.100 optimize.google.com
  ECHO 74.125.24.100 photo.google.com
  ECHO 74.125.24.100 photos.google.com
  ECHO 74.125.24.100 play.google.com
  ECHO 74.125.24.100 plus.google.com
  ECHO 74.125.24.100 productforums.google.com
  ECHO 74.125.24.100 redirector.gvt1.com
  ECHO 74.125.24.100 safebrowsing-cache.google.com
  ECHO 74.125.24.100 store.google.com
  ECHO 74.125.24.100 support.google.com
  ECHO 74.125.24.100 translate.google.com
  ECHO 74.125.24.100 video.google.com
  ECHO 74.125.24.100 www.google-analytics.com
  ECHO 74.125.24.100 encrypted-tbn0.gstatic.com
  ECHO 74.125.24.100 accounts.youtube.com
  ECHO 74.125.24.100 fcmatch.youtube.com
  ECHO 74.125.24.100 img.youtube.com
  ECHO 74.125.24.100 i1.ytimg.com
  ECHO 74.125.24.100 i2.ytimg.com
  ECHO 74.125.24.100 i3.ytimg.com
  ECHO 74.125.24.100 i4.ytimg.com
  ECHO 74.125.24.100 i9.ytimg.com
  ECHO 74.125.24.100 s.ytimg.com
  ECHO 74.125.24.100 ampproject.net
  ECHO 74.125.24.100 www.ampproject.net
  ECHO 74.125.24.100 doubleclick.net
  ECHO 74.125.24.100 www.doubleclick.net
  ECHO 74.125.24.100 schema.org
  ECHO 74.125.24.100 www.schema.org
  ECHO 74.125.24.100 goo.gl
  ECHO 74.125.24.100 www.goo.gl
  ECHO 74.125.24.100 books.google.co.kr
  ECHO 74.125.24.100 gsuite.google.co.kr
  ECHO 74.125.24.110 cse.google.com
  ECHO 74.125.24.118 voice.google.com
  ECHO 74.125.24.119 i.ytimg.com
  ECHO 74.125.24.128 storage.googleapis.com
  ECHO 74.125.24.132 cdn.ampproject.net
  ECHO 74.125.24.132 cdn.ampproject.org
  ECHO 74.125.24.132 1.bp.blogspot.com
  ECHO 74.125.24.132 2.bp.blogspot.com
  ECHO 74.125.24.132 3.bp.blogspot.com
  ECHO 74.125.24.132 4.bp.blogspot.com
  ECHO 74.125.24.132 geo0.ggpht.com
  ECHO 74.125.24.132 geo1.ggpht.com
  ECHO 74.125.24.132 geo2.ggpht.com
  ECHO 74.125.24.132 geo3.ggpht.com
  ECHO 74.125.24.132 lh3.ggpht.com
  ECHO 74.125.24.132 lh4.ggpht.com
  ECHO 74.125.24.132 lh5.ggpht.com
  ECHO 74.125.24.132 yt3.ggpht.com
  ECHO 74.125.24.132 yt4.ggpht.com
  ECHO 74.125.24.132 googledrive.com
  ECHO 74.125.24.132 www.googledrive.com
  ECHO 74.125.24.132 clients2.googleusercontent.com
  ECHO 74.125.24.132 feedback.googleusercontent.com
  ECHO 74.125.24.132 webcache.googleusercontent.com
  ECHO 74.125.24.132 ci3.googleusercontent.com
  ECHO 74.125.24.132 ci4.googleusercontent.com
  ECHO 74.125.24.132 ci5.googleusercontent.com
  ECHO 74.125.24.132 ci6.googleusercontent.com
  ECHO 74.125.24.132 doc-04-2s-docs.googleusercontent.com
  ECHO 74.125.24.132 doc-0k-5c-docs.googleusercontent.com
  ECHO 74.125.24.132 drive-thirdparty.googleusercontent.com
  ECHO 74.125.24.132 lh1.googleusercontent.com
  ECHO 74.125.24.132 lh2.googleusercontent.com
  ECHO 74.125.24.132 lh3.googleusercontent.com
  ECHO 74.125.24.132 lh4.googleusercontent.com
  ECHO 74.125.24.132 lh5.googleusercontent.com
  ECHO 74.125.24.132 lh6.googleusercontent.com
  ECHO 74.125.24.132 translate.googleusercontent.com
  ECHO 74.125.24.132 tpc.googlesyndication.com
  ECHO 74.125.24.141 golang.org
  ECHO 74.125.24.141 www.golang.org
  ECHO 74.125.24.141 blog.golang.org
  ECHO 74.125.24.141 play.golang.org
  ECHO 74.125.24.141 tour.golang.org
  ECHO 74.125.24.141 developer.chrome.com
  ECHO 74.125.24.141 survey.g.doubleclick.net
  ECHO 74.125.24.141 cloud.withgoogle.com
  ECHO 74.125.24.141 csp.withgoogle.com
  ECHO 74.125.24.141 testmysite.withgoogle.com
  ECHO 74.125.24.141 tourbuilder.withgoogle.com
  ECHO 74.125.24.148 ad.doubleclick.net
  ECHO 74.125.24.149 ad.doubleclick.net
  ECHO 74.125.24.148 static.doubleclick.net
  ECHO 74.125.24.149 static.doubleclick.net
  ECHO 74.125.24.148 2542116.fls.doubleclick.net
  ECHO 74.125.24.149 2542116.fls.doubleclick.net
  ECHO 74.125.24.148 s0.2mdn.net
  ECHO 74.125.24.149 s0.2mdn.net
  ECHO 74.125.24.148 s1.2mdn.net
  ECHO 74.125.24.149 s1.2mdn.net
  ECHO 74.125.24.148 s2.2mdn.net
  ECHO 74.125.24.149 s2.2mdn.net
  ECHO 74.125.24.153 chrome-devtools-frontend.appspot.com
  ECHO 74.125.24.153 gweb-multiscreen-hub.appspot.com
  ECHO 74.125.24.153 premiumyva.appspot.com
  ECHO 74.125.24.153 ytkenobi.appspot.com
  ECHO 74.125.24.154 cm.g.doubleclick.net
  ECHO 74.125.24.155 cm.g.doubleclick.net
  ECHO 74.125.24.156 cm.g.doubleclick.net
  ECHO 74.125.24.157 cm.g.doubleclick.net
  ECHO 74.125.24.154 googleads.g.doubleclick.net
  ECHO 74.125.24.155 googleads.g.doubleclick.net
  ECHO 74.125.24.156 googleads.g.doubleclick.net
  ECHO 74.125.24.157 googleads.g.doubleclick.net
  ECHO 74.125.24.154 googleads2.g.doubleclick.net
  ECHO 74.125.24.155 googleads2.g.doubleclick.net
  ECHO 74.125.24.156 googleads2.g.doubleclick.net
  ECHO 74.125.24.157 googleads2.g.doubleclick.net
  ECHO 74.125.24.154 googleads4.g.doubleclick.net
  ECHO 74.125.24.155 googleads4.g.doubleclick.net
  ECHO 74.125.24.156 googleads4.g.doubleclick.net
  ECHO 74.125.24.157 googleads4.g.doubleclick.net
  ECHO 74.125.24.154 pubads.g.doubleclick.net
  ECHO 74.125.24.155 pubads.g.doubleclick.net
  ECHO 74.125.24.156 pubads.g.doubleclick.net
  ECHO 74.125.24.157 pubads.g.doubleclick.net
  ECHO 74.125.24.154 securepubads.g.doubleclick.net
  ECHO 74.125.24.155 securepubads.g.doubleclick.net
  ECHO 74.125.24.156 securepubads.g.doubleclick.net
  ECHO 74.125.24.157 securepubads.g.doubleclick.net
  ECHO 74.125.24.154 stats.g.doubleclick.net
  ECHO 74.125.24.155 stats.g.doubleclick.net
  ECHO 74.125.24.156 stats.g.doubleclick.net
  ECHO 74.125.24.157 stats.g.doubleclick.net
  ECHO 74.125.24.154 adservice.google.com
  ECHO 74.125.24.155 adservice.google.com
  ECHO 74.125.24.156 adservice.google.com
  ECHO 74.125.24.157 adservice.google.com
  ECHO 74.125.24.154 googleadservices.com
  ECHO 74.125.24.155 googleadservices.com
  ECHO 74.125.24.156 googleadservices.com
  ECHO 74.125.24.157 googleadservices.com
  ECHO 74.125.24.154 www.googleadservices.com
  ECHO 74.125.24.155 www.googleadservices.com
  ECHO 74.125.24.156 www.googleadservices.com
  ECHO 74.125.24.157 www.googleadservices.com
  ECHO 74.125.24.154 ade.googlesyndication.com
  ECHO 74.125.24.155 ade.googlesyndication.com
  ECHO 74.125.24.156 ade.googlesyndication.com
  ECHO 74.125.24.157 ade.googlesyndication.com
  ECHO 74.125.24.154 pagead2.googlesyndication.com
  ECHO 74.125.24.155 pagead2.googlesyndication.com
  ECHO 74.125.24.156 pagead2.googlesyndication.com
  ECHO 74.125.24.157 pagead2.googlesyndication.com
  ECHO 74.125.24.154 www.googletagservices.com
  ECHO 74.125.24.155 www.googletagservices.com
  ECHO 74.125.24.156 www.googletagservices.com
  ECHO 74.125.24.157 www.googletagservices.com
  ECHO 74.125.24.154 adservice.google.co.kr
  ECHO 74.125.24.155 adservice.google.co.kr
  ECHO 74.125.24.156 adservice.google.co.kr
  ECHO 74.125.24.157 adservice.google.co.kr
  ECHO 74.125.24.189 0.client-channel.google.com
  ECHO 74.125.24.189 cello.client-channel.google.com
  ECHO 74.125.24.189 93.docs.google.com
  ECHO 74.125.24.191 blogger.com
  ECHO 74.125.24.191 www.blogger.com
  ECHO 74.125.24.191 blogspot.com
  ECHO 74.125.24.191 www.blogger.com
  ECHO 74.125.24.191 blogblog.com
  ECHO 74.125.24.191 www.blogblog.com
  ECHO 74.125.24.191 resources.blogblog.com
) >> C:\Windows\System32\drivers\etc\hosts
echo Add default hosts to hosts file
ping 127.0.0.1 -n 2 >nul
goto :HOST_MENU

:DNS_PATH
cls
echo Set DNS to static 8.8.8.8 primary
netsh interface ip set dns "煎鏽 艙羲 翱唸" static 8.8.8.8 primary
echo.
echo Flush DNS
ipconfig /flushdns
ping 127.0.0.1 -n 2 >nul
goto :HOST_MENU

:OPEN_HOST
echo Open hosts file
start notepad "C:\Windows\System32\drivers\etc\hosts">nul
ping 127.0.0.1 -n 2 >nul
goto :HOST_MENU



:UNLOCK_BEFORE
taskkill /f /im explorer.exe
echo Option Explicit > %temp%\a.vbs
echo Dim styles, WSHShell, regs >> %temp%\a.vbs
echo Set WSHShell = WScript.CreateObject("WScript.Shell") >> %temp%\a.vbs
echo regs = "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools" >> %temp%\a.vbs
echo styles = "REG_DWORD" >> %temp%\a.vbs
echo WSHShell.RegWrite regs, "0", styles  >> %temp%\a.vbs
echo regs = "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr" >> %temp%\a.vbs
echo styles = "REG_DWORD" >> %temp%\a.vbs
echo WSHShell.RegWrite regs, "0", styles >> %temp%\a.vbs
wscript %temp%\a.vbs
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /f
reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layout" /v "Scancode Map" /f
del /f /q /a %temp%\a.vbs
start explorer.exe
echo 晦棟 薯и п薯 諫猿
echo 濡衛 �� 濠翕戲煎 煎斜螃Щ腌棲棻
ping 127.0.0.1 -n 2 > nul
shutdown -l
goto :UNLOCK_MENU

:UNLOCK_AFTER
taskkill /f /im explorer.exe
echo Option Explicit > %temp%\a.vbs
echo Dim styles, WSHShell, regs >> %temp%\a.vbs
echo Set WSHShell = WScript.CreateObject("WScript.Shell") >> %temp%\a.vbs
echo regs = "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools" >> %temp%\a.vbs
echo styles = "REG_DWORD" >> %temp%\a.vbs
echo WSHShell.RegWrite regs, "0", styles  >> %temp%\a.vbs
echo regs = "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr" >> %temp%\a.vbs
echo styles = "REG_DWORD" >> %temp%\a.vbs
echo WSHShell.RegWrite regs, "0", styles >> %temp%\a.vbs
wscript %temp%\a.vbs
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /f
reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layout" /v "Scancode Map" /f
del /f /q /a %temp%\a.vbs
start explorer.exe
cls
echo 晦棟 薯и п薯 諫猿
echo 濡衛 �� 濠翕戲煎 詭景煎 給嬴骨棲棻
goto :UNLOCK_MENU