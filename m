Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.9765.1592990529802341234
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2020 02:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,274,1589212800"; 
   d="scan'208,217";a="95222719"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 24 Jun 2020 17:22:01 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id ED80C4CE49B9
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2020 17:11:37 +0800 (CST)
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 24 Jun 2020 17:22:00 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local ([::1]) by
 G08CNEXMBPEKD05.g08.fujitsu.local ([fe80::4086:9520:5ef9:407d%14]) with mapi
 id 15.00.1497.006; Wed, 24 Jun 2020 17:22:00 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] man-pages: upgrade 5.06 -> 5.07
Thread-Topic: [OE-core] [PATCH] man-pages: upgrade 5.06 -> 5.07
Thread-Index: AQHWSgI1iSjvFPdjUkqtfMkf3bxHKA==
Date: Wed, 24 Jun 2020 09:22:00 +0000
Message-ID: <1592990520040.51768@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.167.33.78]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: ED80C4CE49B9.A9B9C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_159299052004051768cnfujitsucom_"

--_000_159299052004051768cnfujitsucom_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

Pz9maWxlIFJFQURNRSB1cGRhdGUuDQoNClNpZ25lZC1vZmYtYnk6IFdhbmcg
TWluZ3l1IDx3YW5nbXlAY24uZnVqaXRzdS5jb20+DQotLS0NCiAuLi4vbWFu
LXBhZ2VzL3ttYW4tcGFnZXNfNS4wNi5iYiA9PiBtYW4tcGFnZXNfNS4wNy5i
Yn0gICAgICB8IDYgKysrLS0tDQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL21hbi1wYWdlcy97bWFuLXBhZ2VzXzUuMDYuYmIgPT4gbWFu
LXBhZ2VzXzUuMDcuYmJ9ICg4MSUpDQoNCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvbWFuLXBhZ2VzL21hbi1wYWdlc181LjA2LmJiIGIv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL21hbi1wYWdlcy9tYW4tcGFnZXNfNS4w
Ny5iYg0Kc2ltaWxhcml0eSBpbmRleCA4MSUNCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9tYW4tcGFnZXMvbWFuLXBhZ2VzXzUuMDYuYmIN
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWFuLXBhZ2VzL21h
bi1wYWdlc181LjA3LmJiDQppbmRleCAwZDYzMmU2MTcwLi4wNGQwNTk3YjNk
IDEwMDY0NA0KLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21hbi1wYWdl
cy9tYW4tcGFnZXNfNS4wNi5iYg0KKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL21hbi1wYWdlcy9tYW4tcGFnZXNfNS4wNy5iYg0KQEAgLTQsMTEgKzQs
MTEgQEAgU0VDVElPTiA9ICJjb25zb2xlL3V0aWxzIg0KIEhPTUVQQUdFID0g
Imh0dHA6Ly93d3cua2VybmVsLm9yZy9wdWIvbGludXgvZG9jcy9tYW4tcGFn
ZXMiDQogTElDRU5TRSA9ICJHUEx2MisiDQoNCi1MSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9SRUFETUU7bWQ1PTc5NGY3MDE2MTdjYzAzZmU1MGM1MzI1
NzY2MGQ4ZWM0Ig0KK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL1JFQURN
RTttZDU9MjA3ZjcwZjU2NTI2NDE3NTE0YWM0NmI2NjgwZTMxNGYiDQogU1JD
X1VSSSA9ICIke0tFUk5FTE9SR19NSVJST1J9L2xpbnV4L2RvY3MvJHtCUE59
LyR7QlB9LnRhci5neiINCg0KLVNSQ19VUklbbWQ1c3VtXSA9ICJlYmRkYjUy
ZWEwMTNjMTYwZjA3ZmQwYTRhN2U5MjY2ZCINCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiZGE0ZTkzOWM2MjRiZWM0YmFiOGNhMTcwMmU1ZjU0YmJjNzA1MDUw
OTBkOTA5NjdmZDVlMTJiYzE0NTNmMTliMCINCitTUkNfVVJJW21kNXN1bV0g
PSAiMTkzZDkyMjNlOWM2ZGJlMWQ5MjhlYWFlY2MxZjY4ZGIiDQorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjViYTU4ZDdiMmI5YTg5Mjk5MDNiMWNmNzkxZWQ0
ZWRmNzJhYjIyNTY3OGQ1ZWEwYTZiODBkYzA5MDA4MGFjMzMiDQoNCiBpbmhl
cml0IG1hbnBhZ2VzDQoNCi0tDQoyLjE3LjENCg0KPw0KDQoKCg==

--_000_159299052004051768cnfujitsucom_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none"><!-- p { margin-top: 0px; m=
argin-bottom: 0px; }--></style>
</head>
<body dir=3D"ltr" style=3D"font-size:12pt;color:#000000;background-color:#F=
FFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<div>&#8203;&#8203;file README update.</div>
<div><br>
</div>
<div>Signed-off-by: Wang Mingyu &lt;wangmy@cn.fujitsu.com&gt;</div>
<div>---</div>
<div>&nbsp;.../man-pages/{man-pages_5.06.bb =3D&gt; man-pages_5.07.bb}&nbsp=
; &nbsp; &nbsp; | 6 &#43;&#43;&#43;---</div>
<div>&nbsp;1 file changed, 3 insertions(&#43;), 3 deletions(-)</div>
<div>&nbsp;rename meta/recipes-extended/man-pages/{man-pages_5.06.bb =3D&gt=
; man-pages_5.07.bb} (81%)</div>
<div><br>
</div>
<div>diff --git a/meta/recipes-extended/man-pages/man-pages_5.06.bb b/meta/=
recipes-extended/man-pages/man-pages_5.07.bb</div>
<div>similarity index 81%</div>
<div>rename from meta/recipes-extended/man-pages/man-pages_5.06.bb</div>
<div>rename to meta/recipes-extended/man-pages/man-pages_5.07.bb</div>
<div>index 0d632e6170..04d0597b3d 100644</div>
<div>--- a/meta/recipes-extended/man-pages/man-pages_5.06.bb</div>
<div>&#43;&#43;&#43; b/meta/recipes-extended/man-pages/man-pages_5.07.bb</d=
iv>
<div>@@ -4,11 &#43;4,11 @@ SECTION =3D &quot;console/utils&quot;</div>
<div>&nbsp;HOMEPAGE =3D &quot;http://www.kernel.org/pub/linux/docs/man-page=
s&quot;</div>
<div>&nbsp;LICENSE =3D &quot;GPLv2&#43;&quot;</div>
<div><br>
</div>
<div>-LIC_FILES_CHKSUM =3D &quot;file://README;md5=3D794f701617cc03fe50c532=
57660d8ec4&quot;</div>
<div>&#43;LIC_FILES_CHKSUM =3D &quot;file://README;md5=3D207f70f56526417514=
ac46b6680e314f&quot;</div>
<div>&nbsp;SRC_URI =3D &quot;${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.ta=
r.gz&quot;</div>
<div><br>
</div>
<div>-SRC_URI[md5sum] =3D &quot;ebddb52ea013c160f07fd0a4a7e9266d&quot;</div>
<div>-SRC_URI[sha256sum] =3D &quot;da4e939c624bec4bab8ca1702e5f54bbc7050509=
0d90967fd5e12bc1453f19b0&quot;</div>
<div>&#43;SRC_URI[md5sum] =3D &quot;193d9223e9c6dbe1d928eaaecc1f68db&quot;<=
/div>
<div>&#43;SRC_URI[sha256sum] =3D &quot;5ba58d7b2b9a8929903b1cf791ed4edf72ab=
225678d5ea0a6b80dc090080ac33&quot;</div>
<div><br>
</div>
<div>&nbsp;inherit manpages</div>
<div><br>
</div>
<div>--</div>
<div>2.17.1</div>
<div><br>
&#8203;<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_159299052004051768cnfujitsucom_--
