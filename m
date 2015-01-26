Return-Path: <Daniel.Dragomir@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7121765C7B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jan 2015 12:54:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0QCsrNG010194
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 26 Jan 2015 04:54:53 -0800 (PST)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.56]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0174.001;
	Mon, 26 Jan 2015 04:54:53 -0800
From: "Dragomir, Daniel" <Daniel.Dragomir@windriver.com>
To: Armin Kuster <akuster808@gmail.com>
Thread-Topic: [OE-core] [PATCH v2] gcc-runtime: Remove libgfortran data from
	receipe
Thread-Index: AQHQMlW30H8PTtnRK0Cs4U89IDv74ZzMK9ZngACS5oD//3u244AAh66AgAWmnKQ=
Date: Mon, 26 Jan 2015 12:54:52 +0000
Message-ID: <7805B0FACE4FCC4E84636AB320CBA4AC4EE67EB3@ALA-MBB.corp.ad.wrs.com>
References: <1421499689-4863-1-git-send-email-daniel.dragomir@windriver.com>
	<7805B0FACE4FCC4E84636AB320CBA4AC360C560B@ALA-MBB.corp.ad.wrs.com>
	<CAJTo0Lb1jQ_1ZCY8OrL6GaZ7S6VnBf3cea2ndLT1O69OyLW46Q@mail.gmail.com>
	<7805B0FACE4FCC4E84636AB320CBA4AC360C5636@ALA-MBB.corp.ad.wrs.com>,
	<CAJTo0LZRj5OceJHHXRs0EnWyUOnsj4pqv=maeiEZFR69hMk1dw@mail.gmail.com>
In-Reply-To: <CAJTo0LZRj5OceJHHXRs0EnWyUOnsj4pqv=maeiEZFR69hMk1dw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.124.175]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] gcc-runtime: Remove libgfortran data from receipe
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
X-List-Received-Date: Mon, 26 Jan 2015 12:54:56 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_7805B0FACE4FCC4E84636AB320CBA4AC4EE67EB3ALAMBBcorpadwrs_"

--_000_7805B0FACE4FCC4E84636AB320CBA4AC4EE67EB3ALAMBBcorpadwrs_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Armin,
Could you please cherry-pick this patch in dizzy branch?
It is already in master.

Thank you.
Daniel
________________________________
From: Burton, Ross [ross.burton@intel.com]
Sent: Thursday, January 22, 2015 4:33 PM
To: Dragomir, Daniel
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] gcc-runtime: Remove libgfortran data from=
 receipe


On 22 January 2015 at 14:29, Dragomir, Daniel <Daniel.Dragomir@windriver.co=
m<mailto:Daniel.Dragomir@windriver.com>> wrote:
Thank you, Ross!
I don't know the process.
Sorry for insistance.

No insistence noticed - when it's merged just ping Armin to ensure it gets =
backported.

Ross

--_000_7805B0FACE4FCC4E84636AB320CBA4AC4EE67EB3ALAMBBcorpadwrs_
Content-Type: text/html; charset="iso-8859-1"
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
10pt;"><span dir=3D"ltr">Hi
</span><span dir=3D"ltr">Armin,<br>
Could you please cherry-pick this patch in dizzy branch?<br>
It is already in master.<br>
<br>
Thank you.<br>
Daniel<br>
</span>
<div style=3D"font-family: Times New Roman; color: #000000; font-size: 16px=
">
<hr tabindex=3D"-1">
<div style=3D"direction: ltr;" id=3D"divRpF267910"><font color=3D"#000000" =
face=3D"Tahoma" size=3D"2"><b>From:</b> Burton, Ross [ross.burton@intel.com=
]<br>
<b>Sent:</b> Thursday, January 22, 2015 4:33 PM<br>
<b>To:</b> Dragomir, Daniel<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org<br>
<b>Subject:</b> Re: [OE-core] [PATCH v2] gcc-runtime: Remove libgfortran da=
ta from receipe<br>
</font><br>
</div>
<div></div>
<div>
<div dir=3D"ltr">
<div class=3D"gmail_extra"><br>
<div class=3D"gmail_quote">On 22 January 2015 at 14:29, Dragomir, Daniel <s=
pan dir=3D"ltr">
&lt;<a href=3D"mailto:Daniel.Dragomir@windriver.com" target=3D"_blank">Dani=
el.Dragomir@windriver.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex; border-left:1=
px #ccc solid; padding-left:1ex">
<div style=3D"direction:ltr; font-family:Tahoma; color:#000000; font-size:1=
0pt">Thank you, Ross!<br>
I don't know the process. <br>
Sorry for insistance.</div>
</blockquote>
</div>
<br>
No insistence noticed - when it's merged just ping Armin to ensure it gets =
backported.</div>
<div class=3D"gmail_extra"><br>
</div>
<div class=3D"gmail_extra">Ross</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_7805B0FACE4FCC4E84636AB320CBA4AC4EE67EB3ALAMBBcorpadwrs_--
