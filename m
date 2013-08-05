Return-Path: <prathamesh.ghanekar@igate.com>
Received: from as3.igate.com (as3.igate.com [63.241.95.186])
	by mail.openembedded.org (Postfix) with ESMTP id C340F61223
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 17:11:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.89,819,1367996400"; d="scan'208,217";a="30878574"
Received: from unknown (HELO IGTEMUMCAHT01.igatecorp.com) ([10.216.6.48])
	by as3.igate.com with ESMTP/TLS/AES128-SHA; 05 Aug 2013 10:08:48 -0700
Received: from IGTEMUMMB11.igatecorp.com ([fe80::64fc:7b51:1204:8a04]) by
	IGTEMUMCAHT01.igatecorp.com ([::1]) with mapi id 14.03.0146.000;
	Mon, 5 Aug 2013 22:41:43 +0530
From: Prathamesh P Ghanekar <prathamesh.ghanekar@igate.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: meta-
Thread-Index: Ac6R/qtVCxJrK6wKRbWr6WrM7vGXXw==
Date: Mon, 5 Aug 2013 17:11:42 +0000
Message-ID: <2BC3ECFBDE78594E858F96993713F3F9011F939E@IGTEMUMMB11.igatecorp.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.216.5.8]
MIME-Version: 1.0
Subject: meta-
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Aug 2013 17:11:49 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_2BC3ECFBDE78594E858F96993713F3F9011F939EIGTEMUMMB11igat_"

--_000_2BC3ECFBDE78594E858F96993713F3F9011F939EIGTEMUMMB11igat_
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

In the meta-ti layer, there is a repository, which is not fetched by the bu=
ild system during build for whatever reasons. Hence, I manually git cloned =
it.I am not sure, where to place this.Earlier, i tried giving path to that =
repository in the "file://" section.But,it couldn't find the repository. He=
nce, i placed it in the build/downloads/ now.But, still the same error come=
s.Any idea where should we place manually downloaded directories in order t=
o let the build system know the path of the directory???!

Thanks and regards,
Prathamesh Ghanekar
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Disclaimer~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Information contained and transmitted by this e-mail is confidential and pr=
oprietary to iGATE and its affiliates and is intended for use only by the r=
ecipient. If you are not the intended recipient, you are hereby notified th=
at any dissemination, distribution, copying or use of this e-mail is strict=
ly prohibited and you are requested to delete this e-mail immediately and n=
otify the originator or mailadmin@igate.com <mailto:mailadmin@igate.com>. i=
GATE does not enter into any agreement with any party by e-mail. Any views =
expressed by an individual do not necessarily reflect the view of iGATE. iG=
ATE is not responsible for the consequences of any actions taken on the bas=
is of information provided, through this email. The contents of an attachme=
nt to this e-mail may contain software viruses, which could damage your own=
 computer system. While iGATE has taken every reasonable precaution to mini=
mise this risk, we cannot accept liability for any damage which you sustain=
 as a result of software viruses. You should carry out your own virus check=
s before opening an attachment. To know more about iGATE please visit www.i=
gate.com <http://www.igate.com>.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--_000_2BC3ECFBDE78594E858F96993713F3F9011F939EIGTEMUMMB11igat_
Content-Type: text/html; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style id=3D"owaParaStyle" type=3D"text/css">P {margin-top:0;margin-bottom:=
0;}</style>
</head>
<body ocsi=3D"0" fpstyle=3D"1">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;">Hi,<br>
<br>
In the meta-ti layer, there is a repository, which is not fetched by the bu=
ild system during build for whatever reasons. Hence, I manually git cloned =
it.I am not sure, where to place this.Earlier, i tried giving path to that =
repository in the &quot;<a href=3D"file://" target=3D"_blank">file://</a>&q=
uot;
 section.But,it couldn't find the repository. Hence, i placed it in the bui=
ld/downloads/ now.But, still the same error comes.Any idea where should we =
place manually downloaded directories in order to let the build system know=
 the path of the directory???!<br>
<br>
Thanks and regards,<br>
Prathamesh Ghanekar<br>
</div>
<P>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Disclaimer~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>Informat=
ion contained and transmitted by this e-mail is confidential and proprietar=
y to iGATE and its affiliates and is intended for use only by the recipient=
. If you are not the intended recipient, you are hereby notified that any d=
issemination, distribution, copying or use of this e-mail is strictly prohi=
bited and you are requested to delete this e-mail immediately and notify th=
e originator or <A href=3D"mailto:mailadmin@igate.com">mailadmin@igate.com<=
/A>. iGATE does not enter into any agreement with any party by e-mail. Any =
views expressed by an individual do not necessarily reflect the view of iGA=
TE. iGATE is not responsible for the consequences of any actions taken on t=
he basis of information provided, through this email. The contents of an at=
tachment to this e-mail may contain software viruses, which could damage yo=
ur own computer system. While iGATE has taken every reasonable precaution t=
o minimise this risk, we cannot accept liability for any damage which you s=
ustain as a result of software viruses. You should carry out your own virus=
 checks before opening an attachment. To know more about iGATE please visit=
 <A href=3D"http://www.igate.com">www.igate.com</A>.<br>~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br></P></body>
</html>

--_000_2BC3ECFBDE78594E858F96993713F3F9011F939EIGTEMUMMB11igat_--
