Subject: Send bitbake cache (from recipe parsing) to another server
To: openembedded-core@lists.openembedded.org
From: krzysztof.taborski@nokia.com
X-Originating-Location: Wrocław, Lower Silesia, PL (78.11.8.249)
X-Originating-Platform: Linux Chrome 81
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 22 May 2020 04:59:07 -0700
Message-ID: <8RAg.1590148747627277253.zv1v@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="3Od99grXoaUNEhJZd0PC"

--3Od99grXoaUNEhJZd0PC
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I am wondering, if it is possible to archive bitbake cache and send to ano=
ther server.
I tried to archive cache and tmp/cache directories and use them on another=
 server (configs and recipes/workspace name/user name and build server imag=
e were same), but for some reason recipes=C2=A0are re-parsed by bitbake.

First of all, I am wondering, if I have even chances to success in such sc=
enario.
If yes I am guessing, that I should modify BB_HASHCONFIG_WHITELIST , but h=
ow to check what can be missing?

Best regards,
Krzysztof Taborski

--3Od99grXoaUNEhJZd0PC
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,<br /><br />I am wondering, if it is possible to archive bitbake cach=
e and send to another server.&nbsp;<br />I tried to archive cache and tmp/c=
ache directories and use them on another server (configs and recipes/worksp=
ace name/user name and build server image were same), but for some reason r=
ecipes&nbsp;are re-parsed by bitbake.<br /><br />First of all, I am wonderi=
ng, if I have even chances to success in such scenario. <br />If yes I am g=
uessing, that I should modify&nbsp;<span style=3D"color: #004444; font-fami=
ly: Verdana, Sans, sans-serif; font-size: medium; text-align: right;">BB_HA=
SHCONFIG_WHITELIST</span>, but how to check what can be missing?<br /><br /=
>Best regards,<br />Krzysztof Taborski

--3Od99grXoaUNEhJZd0PC--
