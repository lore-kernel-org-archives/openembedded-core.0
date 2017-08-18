Return-Path: <juro.bystricky@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 5441E78462
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 18:27:53 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP; 18 Aug 2017 11:27:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,393,1498546800"; 
	d="scan'208,217";a="141970000"
Received: from orsmsx110.amr.corp.intel.com ([10.22.240.8])
	by fmsmga006.fm.intel.com with ESMTP; 18 Aug 2017 11:27:55 -0700
Received: from orsmsx113.amr.corp.intel.com (10.22.240.9) by
	ORSMSX110.amr.corp.intel.com (10.22.240.8) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Fri, 18 Aug 2017 11:27:54 -0700
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.170]) by
	ORSMSX113.amr.corp.intel.com ([169.254.9.211]) with mapi id
	14.03.0319.002; Fri, 18 Aug 2017 11:27:54 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [PATCH v3 00/11] Reproducible binaries
Thread-Index: AQHTETfNynAW4TLVUkeAe9xueooTOaKK7amA//+NC2s=
Date: Fri, 18 Aug 2017 18:27:53 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B6119E8748@ORSMSX112.amr.corp.intel.com>
References: <1502300913-40295-1-git-send-email-juro.bystricky@intel.com>,
	<CA+chaQcb27Zvu_Hd6pDZ8KHkyF86sJkB3rm4rvzfb_gy98pu4A@mail.gmail.com>
In-Reply-To: <CA+chaQcb27Zvu_Hd6pDZ8KHkyF86sJkB3rm4rvzfb_gy98pu4A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.3.86.137]
MIME-Version: 1.0
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 00/11] Reproducible binaries
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
X-List-Received-Date: Fri, 18 Aug 2017 18:27:54 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_6E51916E4A1F32428260031F4C7CD2B6119E8748ORSMSX112amrcor_"

--_000_6E51916E4A1F32428260031F4C7CD2B6119E8748ORSMSX112amrcor_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I will resend the remaining patches, today & tomorrow. Obviously there are =
also some other changes, but the error you mention should be fixed. I will =
rebase them on the current master as of today
(0bd2dd08e3daf284a6bb7757651af8d40393aec2)


________________________________
From: Martin Jansa [martin.jansa@gmail.com]
Sent: Friday, August 18, 2017 11:11 AM
To: Bystricky, Juro
Cc: Patches and discussions about the oe-core layer; Richard Purdie; Joshua=
 G Lock; Burton, Ross; Juro Bystricky
Subject: Re: [PATCH v3 00/11] Reproducible binaries

I've seen that some of these patches were already merged to master.

Can you please resend remaining patches for oe-core? I'm testing some sligh=
tly older version of your patches and I see couple recipes failing e.g. lik=
e this one:
http://errors.yoctoproject.org/Errors/Details/151939/



--_000_6E51916E4A1F32428260031F4C7CD2B6119E8748ORSMSX112amrcor_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" id=3D"owaParaStyle">P {margin-top:0;margin-bottom:=
0;}</style>
</head>
<body fpstyle=3D"1" ocsi=3D"0">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;">I will resend the remaining patches, today &amp; tomorrow. Obviously=
 there are also some other changes, but the error you mention should be fix=
ed. I will rebase them on the current
 master as of today<br>
(0bd2dd08e3daf284a6bb7757651af8d40393aec2)<br>
<br>
<br>
<div style=3D"font-family: Times New Roman; color: #000000; font-size: 16px=
">
<hr tabindex=3D"-1">
<div id=3D"divRpF105861" style=3D"direction: ltr;"><font size=3D"2" face=3D=
"Tahoma" color=3D"#000000"><b>From:</b> Martin Jansa [martin.jansa@gmail.co=
m]<br>
<b>Sent:</b> Friday, August 18, 2017 11:11 AM<br>
<b>To:</b> Bystricky, Juro<br>
<b>Cc:</b> Patches and discussions about the oe-core layer; Richard Purdie;=
 Joshua G Lock; Burton, Ross; Juro Bystricky<br>
<b>Subject:</b> Re: [PATCH v3 00/11] Reproducible binaries<br>
</font><br>
</div>
<div></div>
<div>
<div dir=3D"ltr">
<div>I've seen that some of these patches were already merged to master.</d=
iv>
<div><br>
</div>
<div>Can you please resend remaining patches for oe-core? I'm testing some =
slightly older version of your patches and I see couple recipes failing e.g=
. like this one:</div>
<a href=3D"http://errors.yoctoproject.org/Errors/Details/151939/" target=3D=
"_blank">http://errors.yoctoproject.org/Errors/Details/151939/</a></div>
<div class=3D"gmail_extra"><br>
<br>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_6E51916E4A1F32428260031F4C7CD2B6119E8748ORSMSX112amrcor_--
