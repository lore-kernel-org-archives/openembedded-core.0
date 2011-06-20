Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QYjXD-0008P6-Ga
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Jun 2011 20:49:20 +0200
Received: from localhost (85.231.30.150) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.137.0; Mon, 20 Jun 2011
	20:44:43 +0200
Date: Mon, 20 Jun 2011 20:44:45 +0200
From: Anders Darander <anders@chargestorm.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110620184433.GA3427@chargestorm.se>
Mail-Followup-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <8DD6CF6F-60B5-4DC0-95BC-3E47550A46FB@dominion.thruhere.net>
	<BANLkTimOnk0XvkfEqP25aOWK0_C7swHvzQ@mail.gmail.com>
	<3486EC57-81AC-4105-AC78-2721DF62E4FF@dominion.thruhere.net>
	<BANLkTi=ws6VEaWRBkDZ8-G5MWgRohNS=Kg@mail.gmail.com>
	<419BA759-C865-411F-BE59-060EBDD74258@dominion.thruhere.net>
	<BANLkTikzAUvWedb0Umy3GhwOtWKhZXRSWA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <BANLkTikzAUvWedb0Umy3GhwOtWKhZXRSWA@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Linux 3.0-rcX (was Re: [RFC] qemu* kernel configs)
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
X-List-Received-Date: Mon, 20 Jun 2011 18:49:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Bruce Ashfield <bruce.ashfield@gmail.com> [110614 17:13]:
> Thanks for the breakdown, it definitely helps. Now that I've got some
> 3.0-rcX items done, and recipe renaming behind me, I'll have a look
> at these and see how best to incorporate the configs.

Just curious, what 3.0-rcX items have you done? Will you submit patches
for these item soon, or wait for a more complete set?

I'm currently just curious, as I've played a little with 3.0-rcX in my
sparetime, and I've got a patch series in a local tree that at least
builds 3.0-rcX (and also removes some of the support for 2.4-kernels).
I've haven't yet looked into libc-headers, just enough to build the
3.0-rcX kernel.

However, I've just learned today, that some other project we're using,
might port their drivers and SW-stack to 3.0-rcX, instead of choosing a
later 2.6.3x kernel. If they go for that route, I'm interested in
getting official 3.0-support in OE-core sooner than later...

Regards,
Anders

-- 
Anders Darander
ChargeStorm AB


