#include<_HttpRequest.au3>
;Đăng nhập
Func login($username,$password)
   $username = _URIEncode($username)
   $password = _URIEncode($password)
   $data_login="email="&$username&"&pass="&$password&"&login=%C4%90%C4%83ng+nh%E1%BA%ADp: undefined"
   $rq1=_HttpRequest(1,"https://m.facebook.com/login.php",$data_login)
   $cookie = _GetCookie($rq1)
   Return $cookie
EndFunc
;Bình luận
Func comment($cookie,$content_cmt,$id_post)
   $content_cmt = _URIEncode($content_cmt)
   $rq2=_HttpRequest(2,"https://m.facebook.com/"&$id_post,"",$cookie)
   $fb_dtsg = StringRegExp($rq2,'name="fb_dtsg" value="(.*?)"',1)[0]
   $fb_dtsg = _URIEncode($fb_dtsg)
   $data_cmt = "fb_dtsg="&$fb_dtsg&"&comment_text="&$content_cmt
   _HttpRequest(1,"https://m.facebook.com/a/comment.php?ft_ent_identifier="&$id_post,$data_cmt,$cookie)
EndFunc
;Gửi tin nhắn
Func send_msg($cookie,$content_msg,$id_tml,$id)
   $content_msg = _URIEncode($content_msg)
   $data = _HttpRequest(2,"https://m.facebook.com/messages/thread/"&$id_tml,"",$cookie)
   $fb_dtsg = StringRegExp($data,'name="fb_dtsg" value="(.*?)"',1)[0]
   $data_send = "fb_dtsg="&$fb_dtsg&"&body="&$content_msg&"&send=G%E1%BB%ADi&tids=cid.c."&$id&"%3A"&$id_tml
   _HttpRequest(1,"https://m.facebook.com/messages/send",$data_send,$cookie)
EndFunc







