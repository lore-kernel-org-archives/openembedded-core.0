Return-Path: <stephen.k.jolley@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 1A9B46E5E9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 02:00:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Oct 2018 19:00:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,386,1534834800"; d="scan'208,217";a="97744817"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
	by fmsmga004.fm.intel.com with ESMTP; 15 Oct 2018 19:00:45 -0700
Received: from fmsmsx123.amr.corp.intel.com ([169.254.7.84]) by
	FMSMSX106.amr.corp.intel.com ([169.254.5.133]) with mapi id
	14.03.0319.002; Mon, 15 Oct 2018 19:00:45 -0700
From: "Jolley, Stephen K" <stephen.k.jolley@intel.com>
To: akuster808 <akuster808@gmail.com>, "yocto@yoctoproject.org"
	<yocto@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] YP 2.7 Planning
Thread-Index: AdRfIsZ9XZFLvLVyS1+NO4aPeSQvxgFsqoUAAAeeD4A=
Date: Tue, 16 Oct 2018 02:00:45 +0000
Message-ID: <9ADD3FDE8B189B4AA2F8A3C711F8155ECEE446B3@fmsmsx123.amr.corp.intel.com>
References: <9ADD3FDE8B189B4AA2F8A3C711F8155ECEE442FB@fmsmsx123.amr.corp.intel.com>
	<60b6c753-6e09-bd10-d4ff-7fb8932d200f@gmail.com>
In-Reply-To: <60b6c753-6e09-bd10-d4ff-7fb8932d200f@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYjAyZTU3OWMtZWQ5ZS00ZWE4LWJkNDMtNjNkYTgxMTk3YWFhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoielRwbUQ5NCs5U2FUV0lHMU4yWE5oTHZZUGt1Ulg0RWtQZFlNXC9iMEJMdXZRSVwvRHRwWDFMNm1PZkhHVG01UTRmIn0=
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.1.200.108]
MIME-Version: 1.0
Subject: Re: YP 2.7 Planning
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
X-List-Received-Date: Tue, 16 Oct 2018 02:00:45 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_9ADD3FDE8B189B4AA2F8A3C711F8155ECEE446B3fmsmsx123amrcor_"

--_000_9ADD3FDE8B189B4AA2F8A3C711F8155ECEE446B3fmsmsx123amrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

No, that will be suggested and hopefully agreed on in the 11/6 Technical me=
eting, as well as the exact milestone dates.

Stephen

From: akuster808 [mailto:akuster808@gmail.com]
Sent: Monday, October 15, 2018 8:22 AM
To: Jolley, Stephen K <stephen.k.jolley@intel.com>; yocto@yoctoproject.org;=
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] YP 2.7 Planning


Stephen,

On 10/15/2018 08:05 AM, Jolley, Stephen K wrote:
All,

We have begun planning for YP 2.7.   In prior versions, items that we didn'=
t have the bandwidth to do were assigned the target milestone of 2.99.  Sin=
ce YP 2.7 planning has just begun, I would like each of you to review the b=
ugs and enhancements in YP 2.99 and determine if you will have the bandwidt=
h to own any of them in YP 2.7.

Do we have the feature freeze date defined yet?

- armin


In addition to reviewing the bugs under your name, also review any under th=
e unassigned name to see if you have both an interest and the time to own a=
ny of those in YP 2.7.

Link for bugs in YP 2.99 by owner: https://wiki.yoctoproject.org/wiki/Bug_T=
riage#2.99_Bugs_by_Owner
Link for enhancements in YP 2.99 by owner: https://wiki.yoctoproject.org/wi=
ki/Bug_Triage#2.99_Enhancements_by_Owner

Thanks,

Stephen K. Jolley
Yocto Project Program Manager
INTEL, MS JF1-255, 2111 N.E. 25th Avenue, Hillsboro, OR 97124
*    Cell:                (208) 244-4460
* Email:                             stephen.k.jolley@intel.com<mailto:step=
hen.k.jolley@intel.com>





--_000_9ADD3FDE8B189B4AA2F8A3C711F8155ECEE446B3fmsmsx123amrcor_
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
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Courier New \;color\:blue";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Courier New \;color\:fuchsia";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Comic Sans MS \;color\:teal";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"MS Sans Serif \,serif\;color\:teal";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"MS Sans Serif \,serif";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p
	{mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body bgcolor=3D"white" lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><a name=3D"_MailEndCompose"><span style=3D"color:#1F=
497D">No, that will be suggested and hopefully agreed on in the 11/6 Techni=
cal meeting, as well as the exact milestone dates.<o:p></o:p></span></a></p=
>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Stephen<o:p></o:p></sp=
an></p>
</div>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><a name=3D"_____replyseparator"></a><b><span style=
=3D"color:windowtext">From:</span></b><span style=3D"color:windowtext"> aku=
ster808 [mailto:akuster808@gmail.com]
<br>
<b>Sent:</b> Monday, October 15, 2018 8:22 AM<br>
<b>To:</b> Jolley, Stephen K &lt;stephen.k.jolley@intel.com&gt;; yocto@yoct=
oproject.org; openembedded-core@lists.openembedded.org<br>
<b>Subject:</b> Re: [OE-core] YP 2.7 Planning<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p>Stephen,<span style=3D"font-size:12.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">On 10/15/2018 08:05 AM, Jolley, Stephen K wrote:<o:p=
></o:p></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<p class=3D"MsoNormal">All,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">We have begun planning for YP 2.7.&nbsp;&nbsp; In pr=
ior versions, items that we didn&#8217;t have the bandwidth to do were assi=
gned the target milestone of 2.99.&nbsp;&nbsp;Since YP 2.7 planning has jus=
t begun, I would like each of you to review the bugs and enhancements
 in YP 2.99 and determine if you will have the bandwidth to own any of them=
 in YP 2.7.
<o:p></o:p></p>
</blockquote>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,serif"><br>
Do we have the feature freeze date defined yet?<br>
<br>
- armin<br>
<br>
<o:p></o:p></span></p>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">In addition to reviewing the bugs under your name, a=
lso review any under the unassigned name to see if you have both an interes=
t and the time to own any of those in YP 2.7.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">Link for bugs in YP 2.99 by owner: <a href=3D"https:=
//wiki.yoctoproject.org/wiki/Bug_Triage#2.99_Bugs_by_Owner">
https://wiki.yoctoproject.org/wiki/Bug_Triage#2.99_Bugs_by_Owner</a><o:p></=
o:p></p>
<p class=3D"MsoNormal">Link for enhancements in YP 2.99 by owner: <a href=
=3D"https://wiki.yoctoproject.org/wiki/Bug_Triage#2.99_Enhancements_by_Owne=
r">
https://wiki.yoctoproject.org/wiki/Bug_Triage#2.99_Enhancements_by_Owner</a=
><o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"page-break-after:avoid;text-autospace:none"=
><b><i><span style=3D"font-size:16.0pt">Stephen K. Jolley</span></i></b><o:=
p></o:p></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New ;color:blue&quot;,serif">Yocto Project Program Manager</span></=
b><o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"page-break-after:avoid;text-autospace:none"=
><b><span style=3D"font-size:10.0pt;font-family:&quot;Courier New ;color:fu=
chsia&quot;,serif">INTEL, MS JF1-255, 2111 N.E. 25th Avenue, Hillsboro, OR =
97124
</span></b><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Wingdings=
">(</span><span style=3D"font-size:9.0pt;font-family:&quot;MS Sans Serif ,s=
erif;color:teal&quot;,serif">&nbsp;&nbsp;&nbsp;
</span><b><span style=3D"font-size:8.0pt;font-family:&quot;Comic Sans MS ;c=
olor:teal&quot;,serif">Cell</span></b><span style=3D"font-size:9.0pt;font-f=
amily:&quot;MS Sans Serif ,serif;color:teal&quot;,serif">:&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;MS Sans Serif ,seri=
f&quot;,serif">(208) 244-4460</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Wingdings=
">* </span>
<b><span lang=3D"FR" style=3D"font-size:8.0pt;font-family:&quot;Comic Sans =
MS ;color:teal&quot;,serif">Email</span></b><span lang=3D"FR" style=3D"font=
-size:9.0pt;font-family:&quot;MS Sans Serif ,serif;color:teal&quot;,serif">=
:</span><span lang=3D"FR" style=3D"font-size:9.0pt;font-family:&quot;MS San=
s Serif ,serif&quot;,serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><u><span lang=3D"FR" style=3D"font-size:9.0pt;font-family:&quot;MS S=
ans Serif ,serif&quot;,serif;color:blue"><a href=3D"mailto:stephen.k.jolley=
@intel.com">stephen.k.jolley@intel.com</a></span></u><o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,serif"><br>
<br>
<o:p></o:p></span></p>
</blockquote>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_9ADD3FDE8B189B4AA2F8A3C711F8155ECEE446B3fmsmsx123amrcor_--
