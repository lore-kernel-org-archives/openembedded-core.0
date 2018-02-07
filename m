Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6C3717780A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Feb 2018 16:25:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Feb 2018 08:25:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,473,1511856000"; d="scan'208,217";a="32867347"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
	by orsmga002.jf.intel.com with ESMTP; 07 Feb 2018 08:25:51 -0800
Received: from orsmsx159.amr.corp.intel.com (10.22.240.24) by
	ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Wed, 7 Feb 2018 08:25:50 -0800
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.11]) by
	ORSMSX159.amr.corp.intel.com ([169.254.11.243]) with mapi id
	14.03.0319.002; Wed, 7 Feb 2018 08:25:50 -0800
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] autoconf-doc: improve reproducibility
Thread-Index: AQHTn7TgRbnrUllJxUO343Q1O45To6OZRjKA///aD5w=
Date: Wed, 7 Feb 2018 16:25:49 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B64053A3C4@ORSMSX112.amr.corp.intel.com>
References: <1517967731-9068-1-git-send-email-juro.bystricky@intel.com>,
	<CAJTo0LaP-MXNqCEdokSmvfaDMz2OYcupWJzzir=sYFriPBqxJA@mail.gmail.com>
In-Reply-To: <CAJTo0LaP-MXNqCEdokSmvfaDMz2OYcupWJzzir=sYFriPBqxJA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.19.9.46]
MIME-Version: 1.0
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autoconf-doc: improve reproducibility
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
X-List-Received-Date: Wed, 07 Feb 2018 16:25:50 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_6E51916E4A1F32428260031F4C7CD2B64053A3C4ORSMSX112amrcor_"

--_000_6E51916E4A1F32428260031F4C7CD2B64053A3C4ORSMSX112amrcor_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



> A neater fix might be to drop the documentation change from the patch we'=
re applying, as it's unlikely that people will be reading the autoconf docu=
mentation.

Yes, I agree. That was my first thought, too. The less patches the better. =
 I'll send a v2 of the patch to the ML and gauge the reaction.

--_000_6E51916E4A1F32428260031F4C7CD2B64053A3C4ORSMSX112amrcor_
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
10pt;"><br>
<div style=3D"font-family: Times New Roman; color: #000000; font-size: 16px=
">
<div id=3D"divRpF92365" style=3D"direction: ltr;"><font size=3D"2" face=3D"=
Tahoma" color=3D"#000000"></font><br>
</div>
<div></div>
<div>
<div dir=3D"ltr">&gt; A neater fix might be to drop the documentation chang=
e from the patch we're applying, as it's unlikely that people will be readi=
ng the autoconf documentation.
<div><br>
</div>
</div>
Yes, I agree. That was my first thought, too. The less patches the better.&=
nbsp; I'll send a v2 of the patch to the ML and gauge the reaction.<br>
</div>
</div>
</div>
</body>
</html>

--_000_6E51916E4A1F32428260031F4C7CD2B64053A3C4ORSMSX112amrcor_--
