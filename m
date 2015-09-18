Return-Path: <adrian.freihofer@neratec.com>
X-Greylist: delayed 366 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 18 Sep 2015 07:52:46 UTC
Received: from mail.neratec.com (mail.neratec.com [46.140.151.2])
	by mail.openembedded.org (Postfix) with ESMTP id 2529D76E04;
	Fri, 18 Sep 2015 07:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.neratec.com (Postfix) with ESMTP id CAAF78BC4C4;
	Fri, 18 Sep 2015 09:46:38 +0200 (CEST)
Received: from mail.neratec.com ([127.0.0.1])
	by localhost (mail.neratec.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id ptqBYtisLwZc; Fri, 18 Sep 2015 09:46:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.neratec.com (Postfix) with ESMTP id 9F4488BC428;
	Fri, 18 Sep 2015 09:46:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at neratec.com
Received: from mail.neratec.com ([127.0.0.1])
	by localhost (mail.neratec.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id R6kvO60Dv2Kx; Fri, 18 Sep 2015 09:46:38 +0200 (CEST)
Received: from mail.neratec.com (mail.neratec.com [192.168.11.23])
	by mail.neratec.com (Postfix) with ESMTP id 71E848BC4C4;
	Fri, 18 Sep 2015 09:46:38 +0200 (CEST)
Date: Fri, 18 Sep 2015 09:46:38 +0200 (CEST)
From: Adrian Freihofer <adrian.freihofer@neratec.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <2142960116.32810.1442562398390.JavaMail.zimbra@neratec.com>
In-Reply-To: <CAMKF1so4a85NDgwLOL1RYHyXQTQcAdHJ9FM7yhaJbrnpTzdx0g@mail.gmail.com>
References: <cover.1441929533.git.raj.khem@gmail.com>
	<e4c70967dd05d254bd59bd4f8a49836c3d499bfb.1441929533.git.raj.khem@gmail.com>
	<80e3806f09d6c399ccd4ccdf5f83997386ec85bc.1441929533.git.raj.khem@gmail.com>
	<CALbNGRR=LAdpubkJGdfx=mx5FGiVW=YDTObwRN8JLAnSfiPc=g@mail.gmail.com>
	<CAMKF1so4a85NDgwLOL1RYHyXQTQcAdHJ9FM7yhaJbrnpTzdx0g@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.11.128]
X-Mailer: Zimbra 8.6.0_GA_1182 (ZimbraWebClient - FF40 (Linux)/8.6.0_GA_1182)
Thread-Topic: systemd: Upgrade 219 -> 225
Thread-Index: krF8oaJVGMv+8thHUFbrF+dPlSqVlw==
Cc: openembedded-devel@lists.openembedded.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 2/3] systemd: Upgrade 219 -> 225
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
X-List-Received-Date: Fri, 18 Sep 2015 07:52:47 -0000
Content-Type: multipart/alternative; 
	boundary="----=_Part_32809_1219333764.1442562398390"

------=_Part_32809_1219333764.1442562398390
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Andreas=20

Here is a first patchset ready for pulling...=20
https://github.com/openembedded/meta-openembedded/pull/16=20


Von: "Khem Raj" <raj.khem@gmail.com>=20
An: "Andreas M=C3=BCller" <schnitzeltony@googlemail.com>=20
CC: openembedded-devel@lists.openembedded.org, "Patches and discussions abo=
ut the oe-core layer" <openembedded-core@lists.openembedded.org>=20
Gesendet: Mittwoch, 16. September 2015 23:18:50=20
Betreff: Re: [OE-core] [PATCH V2 2/3] systemd: Upgrade 219 -> 225=20

On Wed, Sep 16, 2015 at 2:17 PM, Andreas M=C3=BCller=20
<schnitzeltony@googlemail.com> wrote:=20
> Is anybody preparing patches for gudev (many packets in meta-oe require i=
t)?=20
>=20
> If not I can do so. Is the home for libgudev oe-core or better meta-oe?=
=20

meta-oe is better for now. I am not working on it.=20
--=20
_______________________________________________=20
Openembedded-core mailing list=20
Openembedded-core@lists.openembedded.org=20
http://lists.openembedded.org/mailman/listinfo/openembedded-core=20

------=_Part_32809_1219333764.1442562398390
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"font-family: arial, helvetica, sans-serif; font-s=
ize: 10pt; color: #000000"><div>Hi Andreas<br data-mce-bogus=3D"1"></div><d=
iv><br data-mce-bogus=3D"1"></div><div>Here is a first patchset ready for p=
ulling...<br data-mce-bogus=3D"1"></div><div>https://github.com/openembedde=
d/meta-openembedded/pull/16</div><div><br data-mce-bogus=3D"1"></div><hr id=
=3D"zwchr" data-marker=3D"__DIVIDER__"><div data-marker=3D"__HEADERS__"><b>=
Von: </b>"Khem Raj" &lt;raj.khem@gmail.com&gt;<br><b>An: </b>"Andreas M=C3=
=BCller" &lt;schnitzeltony@googlemail.com&gt;<br><b>CC: </b>openembedded-de=
vel@lists.openembedded.org, "Patches and discussions about the oe-core laye=
r" &lt;openembedded-core@lists.openembedded.org&gt;<br><b>Gesendet: </b>Mit=
twoch, 16. September 2015 23:18:50<br><b>Betreff: </b>Re: [OE-core] [PATCH =
V2 2/3] systemd: Upgrade 219 -&gt; 225<br></div><div><br></div><div data-ma=
rker=3D"__QUOTED_TEXT__">On Wed, Sep 16, 2015 at 2:17 PM, Andreas M=C3=BCll=
er<br>&lt;schnitzeltony@googlemail.com&gt; wrote:<br>&gt; Is anybody prepar=
ing patches for gudev (many packets in meta-oe require it)?<br>&gt;<br>&gt;=
 If not I can do so. Is the home for libgudev oe-core or better meta-oe?<br=
><br>meta-oe is better for now. I am not working on it.<br>-- <br>_________=
______________________________________<br>Openembedded-core mailing list<br=
>Openembedded-core@lists.openembedded.org<br>http://lists.openembedded.org/=
mailman/listinfo/openembedded-core<br></div></div></body></html>

------=_Part_32809_1219333764.1442562398390--
