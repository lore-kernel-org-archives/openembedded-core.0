Return-Path: <0101016cf285adb9-e8e509b0-b86d-42cd-adff-7e6d52c82f63-000000@us-west-2.amazonses.com>
X-Greylist: delayed 672 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 02 Sep 2019 15:20:13 UTC
Received: from a27-223.smtp-out.us-west-2.amazonses.com
	(a27-223.smtp-out.us-west-2.amazonses.com [54.240.27.223])
	by mail.openembedded.org (Postfix) with ESMTP id E07867F35B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2019 15:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1567436942;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:References:Message-Id:Feedback-ID;
	bh=lrj+ZXbqxUCiC0SbR/mnQCX4x0jmvUMox/XPPFUy7RA=;
	b=BmEfjoEh6ASSyfJiS62R3hiAu30oQTFe60RSdOcspUphmTLa1+0RZaTExpOQRBKs
	7mHmo5rLijQt0ghccDbwF/G7GFrwV3SEVdscQpblvK3GknM0ZM+6jZDN+b3mvIDEksZ
	ZaZBldf3Qh8qzSTGRuxXVSmWI/siED9j6J9ykJjE=
From: =?UTF-8?Q?Benjamin_Esquivel?= <code@esquibits.com>
To: =?UTF-8?Q?akuster808=40gmail=2Ecom?= <akuster808@gmail.com>
Date: Mon, 2 Sep 2019 15:09:02 +0000
Mime-Version: 1.0
References: <mail.5d6d308e.05fc.29fd19260c1acb5c@storage.wm.amazon.com>
X-Priority: 3 (Normal)
X-Mailer: Amazon WorkMail
Thread-Index: AQHVYZ/uD45DUOCtSouaKKF75i3Ing==
Message-ID: <0101016cf285adb9-e8e509b0-b86d-42cd-adff-7e6d52c82f63-000000@us-west-2.amazonses.com>
X-SES-Outgoing: 2019.09.02-54.240.27.223
Feedback-ID: 1.us-west-2.An468LAV0jCjQDrDLvlZjeAthld7qrhZr+vow8irkvU=:AmazonSES
Cc: =?UTF-8?Q?openembedded-core=40lists=2Eopenembedded=2Eorg?=
	<openembedded-core@lists.openembedded.org>
Subject: qemu-native fix for latest kernel update
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
X-List-Received-Date: Mon, 02 Sep 2019 15:20:14 -0000
Content-Type: multipart/alternative; 
	boundary="=_e2jrYzDzBxeGAXjcZG-5bV1dKTcI2hYDfAs39vL2vQq4WUcv"

--=_e2jrYzDzBxeGAXjcZG-5bV1dKTcI2hYDfAs39vL2vQq4WUcv
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thanks Armin for sending the fix for the latest kernel updates, my build =
strangely started failing about a week or 2 ago after the latest dnf upda=
te.

=C2=A0
Regards,

=C2=A0
Benjamin


--=_e2jrYzDzBxeGAXjcZG-5bV1dKTcI2hYDfAs39vL2vQq4WUcv
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML><html>
<head>
<meta name=3D"Generator" content=3D"Amazon WorkMail v3.0-4482">
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">=

<title>qemu-native fix for latest kernel update</title>
</head>
<body>
<p style=3D"margin: 0px; font-family: Arial, Tahoma, Helvetica, sans-seri=
f; font-size: small;">Thanks Armin for sending the fix for the latest ker=
nel updates, my build strangely started failing about a week or 2 ago aft=
er the latest dnf update.</p><p style=3D"margin: 0px; font-family: Arial,=
 Tahoma, Helvetica, sans-serif; font-size: small;">&nbsp;</p><p style=3D"=
margin: 0px; font-family: Arial, Tahoma, Helvetica, sans-serif; font-size=
: small;">Regards,</p><p style=3D"margin: 0px; font-family: Arial, Tahoma=
, Helvetica, sans-serif; font-size: small;">&nbsp;</p><p style=3D"margin:=
 0px; font-family: Arial, Tahoma, Helvetica, sans-serif; font-size: small=
;">Benjamin</p>
</body>
</html>

--=_e2jrYzDzBxeGAXjcZG-5bV1dKTcI2hYDfAs39vL2vQq4WUcv--
