Return-Path: <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
Received: from mailhost.eurogiciel.fr (mailhost.eurogiciel.fr [86.64.47.76])
	by mail.openembedded.org (Postfix) with ESMTP id 2CB4560664
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 14:48:46 +0000 (UTC)
Received: from (31l-syracuse.eurogiciel.fr [172.16.88.4]) by
	mailhost.eurogiciel.fr with smtp
	id 1c2b_efdb_73810ace_213b_11e3_a82b_a4badbe01a3a;
	Thu, 19 Sep 2013 16:54:57 +0200
Received: from 06s-venera.eurogiciel.fr ([172.16.92.15]) by
	31l-syracuse.eurogiciel.fr with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 19 Sep 2013 16:48:44 +0200
Received: from 44c-mariner.eurogiciel.fr ([172.16.96.15]) by
	06s-venera.eurogiciel.fr with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 19 Sep 2013 16:48:43 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 19 Sep 2013 16:48:42 +0200
Message-ID: <552A140193B5B04F9B5027CA06300D85C47CD6@44c-mariner.eurogiciel.fr>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: Building a Poky distribution based on Wayland/Weston 1.2
Thread-Index: Ac61R1Ul+DcQipWkSii9MMvSi89kDQ==
From: "Ewan LE BIDEAU-CANEVET" <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
To: <openembedded-core@lists.openembedded.org>, <yocto@yoctoproject.org>,
	<poky@yoctoproject.org>
X-OriginalArrivalTime: 19 Sep 2013 14:48:43.0922 (UTC)
	FILETIME=[56858720:01CEB547]
Subject: Building a Poky distribution based on Wayland/Weston 1.2
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
X-List-Received-Date: Thu, 19 Sep 2013 14:48:49 -0000
Content-class: urn:content-classes:message
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01CEB547.559AA6B0"

------_=_NextPart_001_01CEB547.559AA6B0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,


I'm currently trying to have a poky distribution with Wayland/Weston 1.2 =
and no X server at all. I think I have successfully ported =
Wayland/Weston to 1.2 version and disabled the X server, so here is my =
questions :


1) Does this project interest you ?

2) How can I test if Wayland  has been correctly built ?

Currently, the Weston shell is up and running.

3) Knowing I started my project from Poky and Open-Embedded =
repositories, on which upstream repository can I deliver my work ?

I added a poky distro configuration that seems to be delivered into =
Yocto git , is it correct?

About the changes around Weston & Wayland, the new bb files should be =
delivered in YOCTO or OpenEmbedded project?

Thank you for your attention.

Ewan Le Bideau-Can=E9vet=20

------_=_NextPart_001_01CEB547.559AA6B0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.5.7638.1">
<TITLE>Building a Poky distribution based on Wayland/Weston 1.2</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/plain format -->

<P><FONT SIZE=3D2>Hello,<BR>
<BR>
<BR>
I'm currently trying to have a poky distribution with Wayland/Weston 1.2 =
and no X server at all. I think I have successfully ported =
Wayland/Weston to 1.2 version and disabled the X server, so here is my =
questions :<BR>
<BR>
<BR>
1) Does this project interest you ?<BR>
<BR>
2) How can I test if Wayland&nbsp; has been correctly built ?<BR>
<BR>
Currently, the Weston shell is up and running.<BR>
<BR>
3) Knowing I started my project from Poky and Open-Embedded =
repositories, on which upstream repository can I deliver my work ?<BR>
<BR>
I added a poky distro configuration that seems to be delivered into =
Yocto git , is it correct?<BR>
<BR>
About the changes around Weston &amp; Wayland, the new bb files should =
be delivered in YOCTO or OpenEmbedded project?<BR>
<BR>
Thank you for your attention.<BR>
<BR>
Ewan Le Bideau-Can=E9vet<BR>
</FONT>
</P>

</BODY>
</HTML>

------_=_NextPart_001_01CEB547.559AA6B0--
