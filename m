Return-Path: <just4tech83@gmail.com>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0463870254
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jul 2014 06:52:58 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id hw13so4484629qab.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jul 2014 23:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=oh8vWafuGlwu4TEMDSRBrzrZzuwazFIRQgnuV7c4Zho=;
	b=AmLjvh7Ot2ym8LyB8xgOA01yBPo+wc4iM8Wk+8iAL8phWmQud/pMiERGWDvw31WF14
	4wHmnXCwfTsyxt8vYi3GQb1df0sqk1G421rWUNOq/I17E1Pgy0NWBWCmRvil3FD416ZS
	cSF010zBNW+YDxJ9UY0j15Y+nRK1LdPpIrR9PEGarXsoC5vX687wEeclnwEj+MbhG8Qm
	i402ppfxGjaORRNQwp9Y/ThHXRuebJNNzjU9MgqSr3FSa9oBJ8+bvt164txhtGAZyCAS
	gxjWPYheLdc+ayAFdG2GPYCIE5KLbpeKfbjn1ui+0h7A986NDRFSe+T8tCG5YwxE+ENx
	4FDA==
MIME-Version: 1.0
X-Received: by 10.224.49.71 with SMTP id u7mr55879034qaf.58.1404802379803;
	Mon, 07 Jul 2014 23:52:59 -0700 (PDT)
Received: by 10.140.16.103 with HTTP; Mon, 7 Jul 2014 23:52:59 -0700 (PDT)
Date: Tue, 8 Jul 2014 12:22:59 +0530
Message-ID: <CAD2C2VS999rDn_WEdtaiRPMdtCFgbzY_iqm2ex6Kc3Vm0f8NaQ@mail.gmail.com>
From: Bryan <just4tech83@gmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: OpenEmbedded build issues with beagle board
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
X-List-Received-Date: Tue, 08 Jul 2014 06:53:05 -0000
Content-Type: multipart/alternative; boundary=001a11c300a8d3ef9e04fda90a15

--001a11c300a8d3ef9e04fda90a15
Content-Type: text/plain; charset=UTF-8

Hi All
 I am trying to build  Openembeeded classic for Beagle board-XM but i am
getting lot of broken link issues. I have  set DISTRO as angstrom-2010.x in
local.conf.   Is this approach  ok? or should i move to openembedded core ??
Pls suggest.

Broken link e.g.

Resolving www.angstrom-distribution.org (www.angstrom-distribution.org)...
140.211.169.177
 Connecting to www.angstrom-distribution.org
(www.angstrom-distribution.org)|140.211.169.177|:80...
connected.
 HTTP request sent, awaiting response...
404 Not Found  2014-07-08 10:13:43 ERROR 404: Not Found.

Thanks in advance

--001a11c300a8d3ef9e04fda90a15
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br></div><div>Hi All</div><div>=C2=A0I am trying to bu=
ild =C2=A0Openembeeded classic for Beagle board-XM but i am getting lot of =
broken link issues. I have =C2=A0set DISTRO as angstrom-2010.x in local.con=
f. =C2=A0 Is this approach =C2=A0ok? or should i move to openembedded core =
??</div>
<div>Pls suggest.=C2=A0</div><div><br></div><div>Broken link e.g.=C2=A0</di=
v><div><br></div><div>Resolving <a href=3D"http://www.angstrom-distribution=
.org">www.angstrom-distribution.org</a> (<a href=3D"http://www.angstrom-dis=
tribution.org">www.angstrom-distribution.org</a>)... 140.211.169.177</div>
<div>=C2=A0Connecting to <a href=3D"http://www.angstrom-distribution.org">w=
ww.angstrom-distribution.org</a> (<a href=3D"http://www.angstrom-distributi=
on.org">www.angstrom-distribution.org</a>)|140.211.169.177|:80... connected=
.</div>
<div>=C2=A0HTTP request sent, awaiting response...=C2=A0</div><div>404 Not =
Found =C2=A02014-07-08 10:13:43 ERROR 404: Not Found.</div><div><br></div><=
div>Thanks in advance</div><div><br></div>

--001a11c300a8d3ef9e04fda90a15--
