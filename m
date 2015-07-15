Return-Path: <zhenhua.luo@freescale.com>
X-Greylist: delayed 1899 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 15 Jul 2015 04:12:52 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0144.outbound.protection.outlook.com [157.56.111.144])
	by mail.openembedded.org (Postfix) with ESMTP id 430657391D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 04:12:52 +0000 (UTC)
Received: from BN3PR03MB1367.namprd03.prod.outlook.com (10.163.34.153) by
	BN3PR03MB1366.namprd03.prod.outlook.com (10.163.34.152) with Microsoft
	SMTP Server (TLS) id 15.1.213.14; Wed, 15 Jul 2015 03:41:12 +0000
Received: from BN3PR03MB1367.namprd03.prod.outlook.com ([10.163.34.153]) by
	BN3PR03MB1367.namprd03.prod.outlook.com ([10.163.34.153]) with mapi id
	15.01.0213.000; Wed, 15 Jul 2015 03:41:12 +0000
From: Luo Zhenhua <zhenhua.luo@freescale.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Thread-Topic: Query about the toolchian version of Yocto 1.9
Thread-Index: AdC+r6iszC4uIAiVR9SVHhXYmbSO3Q==
Date: Wed, 15 Jul 2015 03:41:12 +0000
Message-ID: <BN3PR03MB1367ABE95BBD2A48796FF31FE49A0@BN3PR03MB1367.namprd03.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none;
x-originating-ip: [192.158.241.86]
x-microsoft-exchange-diagnostics: 1; BN3PR03MB1366;
	5:g/Q5lx47qWRus91iLO9rrLN8QsjTeu5bsnfakzhuwRfWgBAKRBd5rZkhYWED9CH+ltMVdJL1Xmf4Q8MYoAQkaS6M7euaR9nbBDQsFATLNgS4Gcf4F64La182QwGImq6vgiTRlz+t/dVGeJ+488teUA==;
	24:l/chf1HUfWemQ6SAyOCO1W/eEQPrYYJ9AX2lRN9GHrxX05h+Ja+caTO9mM5Q8xCwxStoG2hjK+QdAxruzc5hg0j7k8sMQ/qR1EFS7/2mKx8=;
	20:Mezx6r71mrVQzbdXbBYtOpT+rbIJaKbV9WOHO/3FMtJEPYpDlpwxkNKoCoBZHIUKOqorGc67HOz4T88CzJdLRQ==
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR03MB1366;
bn3pr03mb1366: X-MS-Exchange-Organization-RulesExecuted
x-microsoft-antispam-prvs: <BN3PR03MB136653E8A868228A478EC3DFE49A0@BN3PR03MB1366.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(108003899814671);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BN3PR03MB1366; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR03MB1366; 
x-forefront-prvs: 0638FD5066
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(107886002)(40100003)(46102003)(74316001)(19580395003)(50986999)(87936001)(19300405004)(86362001)(62966003)(2656002)(5002640100001)(5003600100002)(19625215002)(33656002)(66066001)(16236675004)(5001920100001)(189998001)(2900100001)(102836002)(99286002)(54356999)(77156002)(77096005)(110136002)(558084003)(450100001)(92566002)(76576001)(229853001)(5001960100002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR03MB1366;
	H:BN3PR03MB1367.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2015 03:41:12.2160 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB1366
Subject: Query about the toolchian version of Yocto 1.9
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
X-List-Received-Date: Wed, 15 Jul 2015 04:12:53 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN3PR03MB1367ABE95BBD2A48796FF31FE49A0BN3PR03MB1367namp_"

--_000_BN3PR03MB1367ABE95BBD2A48796FF31FE49A0BN3PR03MB1367namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I can see that there are recipes of 3 gcc version(4.8, 4.9, 5.1) in master =
branch of Yocto, may I know which one will be officially supported by Yocto=
 1.9 release? Will the other versions be tested and supported?


Best Regards,

Zhenhua

--_000_BN3PR03MB1367ABE95BBD2A48796FF31FE49A0BN3PR03MB1367namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
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
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi, <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I can see that there are recipes of 3 gcc version(4.=
8, 4.9, 5.1) in master branch of Yocto, may I know which one will be offici=
ally supported by Yocto 1.9 release? Will the other versions be tested and =
supported?
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Zhenhua<o:p></o:p></p>
</div>
</body>
</html>

--_000_BN3PR03MB1367ABE95BBD2A48796FF31FE49A0BN3PR03MB1367namp_--
