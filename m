Return-Path: <B51469@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0116.outbound.protection.outlook.com [65.55.169.116])
	by mail.openembedded.org (Postfix) with ESMTP id 56C4B65D59
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 02:40:05 +0000 (UTC)
Received: from BL2PR03MB497.namprd03.prod.outlook.com (10.141.93.142) by
	BL2PR03MB499.namprd03.prod.outlook.com (10.141.93.147) with Microsoft
	SMTP Server (TLS) id 15.1.11.14; Mon, 3 Nov 2014 02:40:04 +0000
Received: from BL2PR03MB497.namprd03.prod.outlook.com ([10.141.93.142]) by
	BL2PR03MB497.namprd03.prod.outlook.com ([10.141.93.142]) with mapi id
	15.01.0011.000; Mon, 3 Nov 2014 02:40:04 +0000
From: Benlei Xu <B51469@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: openstack dashboard can not use console, need your help
Thread-Index: Ac/3D3dGcMQvKAahSA6rted3aEQmQA==
Date: Mon, 3 Nov 2014 02:40:04 +0000
Message-ID: <d9b048eceb9f46ae8bfef3c79a6ab9cf@BL2PR03MB497.namprd03.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [123.151.195.50]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:;SRVR:BL2PR03MB499;
x-exchange-antispam-report-test: UriScan:;
x-forefront-prvs: 0384275935
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(53754006)(189002)(199003)(4396001)(54356999)(19625215002)(120916001)(50986999)(19300405004)(64706001)(20776003)(108616004)(33646002)(74316001)(21056001)(97736003)(66066001)(110136001)(101416001)(86362001)(18717965001)(95666004)(229853001)(31966008)(99396003)(99286002)(92566001)(15202345003)(106356001)(105586002)(2656002)(107886001)(2351001)(107046002)(16236675004)(46102003)(15975445006)(77156002)(62966003)(40100003)(87936001)(76576001)(122556002)(19580395003)(450100001)(24736002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BL2PR03MB499;
	H:BL2PR03MB497.namprd03.prod.outlook.com; FPR:; MLV:sfv;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: openstack dashboard can not use console, need your help
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
X-List-Received-Date: Mon, 03 Nov 2014 02:40:08 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_d9b048eceb9f46ae8bfef3c79a6ab9cfBL2PR03MB497namprd03pro_"

--_000_d9b048eceb9f46ae8bfef3c79a6ab9cfBL2PR03MB497namprd03pro_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all,

                I have a issue need to ensure, I am launching instance on p=
owerpc arch board, but there is a issue  that "Error: internal error: proce=
ss exited while connecting to monitor: VNC support is disabled". If "vnc_en=
abled" is set False in nova.conf, the instance can created successfully.  I=
 guess that there is no vnc server in yocto packages.

                So,  I want to know, where yocto support vnc server or not =
and how can I get vnc server package on powerpc arch.

Thanks.

Best Regards,
Benlei


--_000_d9b048eceb9f46ae8bfef3c79a6ab9cfBL2PR03MB497namprd03pro_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:\5B8B\4F53;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@\5B8B\4F53";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I have a issue need to ensure, I am =
launching instance on powerpc arch board, but there is a issue&nbsp; that &=
#8220;Error: internal error: process exited while connecting to monitor: VN=
C support is disabled&#8221;. If &#8220;vnc_enabled&#8221; is set
 False in nova.conf, the instance can created successfully. &nbsp;I guess t=
hat there is no vnc server in yocto packages.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; So,&nbsp; I want to know, where yoct=
o support vnc server or not and how can I get vnc server package on powerpc=
 arch.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in">Thanks.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Benlei<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_d9b048eceb9f46ae8bfef3c79a6ab9cfBL2PR03MB497namprd03pro_--
