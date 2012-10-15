Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1TNdWV-00080i-14
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Oct 2012 07:47:31 +0200
Received: from localhost (193.41.119.134) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.279.1; Mon, 15 Oct 2012
	07:27:57 +0200
Date: Mon, 15 Oct 2012 07:34:15 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20121015053414.GA9736@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <1349962030-9309-1-git-send-email-paul.eggleton@linux.intel.com>
	<50785C63.5060303@linux.intel.com> <50786000.7010008@linaro.org>
MIME-Version: 1.0
In-Reply-To: <50786000.7010008@linaro.org>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.20 (2009-12-10)
X-GFI-SMTP-Submission: 1
Subject: Re: [PATCH] local.conf.sample: add PATH to SSTATE_MIRRORS comments
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Oct 2012 05:47:31 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org> [121012 20:19]:

> W dniu 12.10.2012 20:07, Saul Wold pisze:
> > On 10/11/2012 06:27 AM, Paul Eggleton wrote:

> >>   meta/conf/local.conf.sample |    7 +++++--
> >>   1 file changed, 5 insertions(+), 2 deletions(-)

> > I think this is really a Poky File, so should go to the
> > poky@yoctoproject.org!

> For me this file is part of OE-Core so list is proper. If OE-Core has
> some Poky files then maybe consider moving them to separate layer?

For me, that's also correct.

If a file exists in oe-core, it's an oe-core file and patches goes here.

> Look at OE-Core from perspective of external developers. They change
> files and then send patches here. Would you say them "go to other ML
> with it" just because of history relations when they did proper thing?

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
Anders Darander
ChargeStorm AB / eStorm AB


