Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QsuIj-0002pK-4N
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 12:21:45 +0200
Received: by wwe32 with SMTP id 32so3897396wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 03:17:09 -0700 (PDT)
Received: by 10.216.46.75 with SMTP id q53mr3134382web.65.1313403429210;
	Mon, 15 Aug 2011 03:17:09 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id s49sm3142763wec.25.2011.08.15.03.17.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 15 Aug 2011 03:17:08 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1313402929.git.paul.eggleton@linux.intel.com>
Date: Mon, 15 Aug 2011 12:17:06 +0200
Message-Id: <38B4DA61-0BF4-48D8-A7F4-CDC2354755A4@dominion.thruhere.net>
References: <cover.1313402929.git.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 0/4] qt4-native, Qt QA fixes
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
X-List-Received-Date: Mon, 15 Aug 2011 10:21:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 aug. 2011, om 12:12 heeft Paul Eggleton het volgende geschreven:

> Bring over qt4-native from OE and tidy up some QA warnings.
>=20
> The following changes since commit =
d126e22f6b3f27196144f87e22b36ebccd6dea65:
>=20
>  rt-tests: use an explicit commit ID (2011-08-12 17:51:18 +0100)
>=20
> are available in the git repository at:
>  git://git.openembedded.org/openembedded-core-contrib paule/qt4-fixes4
>  =
http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3Dp=
aule/qt4-fixes4
>=20
> Paul Eggleton (4):
>  qt4: replace qt4-tools-native with qt4-native
>  qt4-native: restore build of uic3, qdbuscpp2xml and qdbusxml2cpp
>  qt4: package QML plugins and correct their install directory
>  qt4: delete unpackaged uic3 to avoid unpackaged file warning

=46rom a quick look these look good to, I hope to be able to do an =
actual test later this week=


