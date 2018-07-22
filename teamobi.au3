#include<_HttpRequest.au3>
;Đăng nhập vào diễn đàn teamobi
Func login($username,$password)
   $url_rq1 = "http://my.teamobi.com/app/login.php"
   $url_log = "http://my.teamobi.com/app/index.php?do=login"
   $rq1 = _HttpRequest(2,$url_rq1)
   $check_ru = StringRegExp($rq1,'name="checkru" value="(.*?)"',1)
   $check_ru = $check_ru[0]
   $data_login = "nav=&user="&$username&"&pass="&$password&"&checkru="&$check_ru&"&submit=%C4%90%C4%83ng+nh%E1%BA%ADp: undefined"
   $data = _HttpRequest(1,$url_log,$data_login)
EndFunc
;Bình luận vào bài viết
Func comment($url,$content)
   $rq2 = _HttpRequest(2,$url)
   $txtbox = StringRegExp($url,'uid=(.*?)&',1)[0]
   $box_id = StringRegExp($rq2,'name="box_id" value="(.*?)"',1)[0]
   $trang = StringRegExp($rq2,'name="trang" value=(.*?) />',1)[0]
   $ma = StringRegExp($rq2,'type="hidden" value="(.*?)" name',1)[0]
   $content=_URIEncode($content)
   $data_post= "trang="&$trang&"&box_id="&$box_id&"&txtbox="&$txtbox&"&txtndung="&$content&"%09%09%09%09%09%09%09%09%09&"&$ma&"="&$ma&"&UpdateCM=submit: undefined"
   _HttpRequest(1,$url,$data_post)
   Sleep(21000);20s mới bình luận được tiếp =))
EndFunc
$username = ''
$password = ''
$url = "" ;url bài viết
$content = "" ;nội dung bình luận
login($username,$password)
comment($url,$content)