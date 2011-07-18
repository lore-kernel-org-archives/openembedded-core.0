Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QirTn-0000gM-Py
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jul 2011 19:19:39 +0200
Received: by wwi18 with SMTP id 18so2822196wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2011 10:15:35 -0700 (PDT)
Received: by 10.216.63.15 with SMTP id z15mr3186178wec.7.1311009335474;
	Mon, 18 Jul 2011 10:15:35 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id gb1sm3632440wbb.3.2011.07.18.10.15.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jul 2011 10:15:34 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <2ACEB6D6-846E-479C-AAE1-5C43687FD581@dominion.thruhere.net>
Date: Mon, 18 Jul 2011 19:15:32 +0200
Message-Id: <E0F5D9BD-075B-439F-AE3E-247CF7F06D82@dominion.thruhere.net>
References: <2ACEB6D6-846E-479C-AAE1-5C43687FD581@dominion.thruhere.net>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Incomplete licensing in recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Jul 2011 17:19:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 17 jul 2011, om 11:40 heeft Koen Kooi het volgende geschreven:

> Hi,
>=20
> I was looking at the testlab output for licensing [1] and noticed that =
eglibc(-locale) and libcap2 just say (L)GPL and don't specify the =
version, was that intended?

Same for linux-yocto:

+                                              GPL : =
kernel_2.6.37+git1+d5d3c6480d61f83503ccef7fbcd765f7aca8b71b_1+92232beb4e72=
fcf8d85abe79edba0cdf53f1ce41-r20_qemuarm.ipk


>=20
> regards,
>=20
> Koen
>=20
> [1] =
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/testlab/tree/hawkboa=
rd/eglibc/systemd-image/installed-package-licenses.txt?h=3Dyocto&id=3Dff18=
5d46e0da70dba80a540a9d7d6757cd213931



