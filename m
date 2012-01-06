Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RjB4x-0006hf-Gk
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 15:47:36 +0100
Received: by wgbds11 with SMTP id ds11so1515597wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2012 06:40:08 -0800 (PST)
Received: by 10.180.85.4 with SMTP id d4mr11733045wiz.0.1325860808273;
	Fri, 06 Jan 2012 06:40:08 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id bl10sm2993371wib.0.2012.01.06.06.40.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 Jan 2012 06:40:07 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1325852541.20759.94.camel@ted>
Date: Fri, 6 Jan 2012 15:40:06 +0100
Message-Id: <09E4C051-91F1-4F9F-93BC-152E0EC5059C@dominion.thruhere.net>
References: <cover.1325836241.git.sgw@linux.intel.com>
	<1325852541.20759.94.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [CONSOLIDATED PULL 00/25] Various Patches
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
X-List-Received-Date: Fri, 06 Jan 2012 14:47:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 jan. 2012, om 13:22 heeft Richard Purdie het volgende geschreven:

>=20
>=20
>> udev: improve udev-cache robustness
>=20
> but I didn't take this. We need a better solution.

Is the cache actually still needed? I'm not using it in angstrom and =
udev only takes a few milliseconds to do its thing. But I'm not using =
sysvinit anymore either.

regards,

Koen=


