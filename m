Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RnpMc-0007Vr-9r
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 11:37:02 +0100
Received: by werb12 with SMTP id b12so1856417wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 02:29:23 -0800 (PST)
Received: by 10.216.132.88 with SMTP id n66mr6763071wei.32.1326968963123;
	Thu, 19 Jan 2012 02:29:23 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id n3sm64741275wiz.9.2012.01.19.02.29.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jan 2012 02:29:22 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <5ab12509051b732944a5027750505fa860133f1b.1326964778.git.sgw@linux.intel.com>
Date: Thu, 19 Jan 2012 11:29:23 +0100
Message-Id: <1A94A9A8-8B34-4B8F-AAB4-98C172E584E5@dominion.thruhere.net>
References: <cover.1326964778.git.sgw@linux.intel.com>
	<5ab12509051b732944a5027750505fa860133f1b.1326964778.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [CONSOLIDATED PULL 02/33] busybox: defconfig modified in order to activate CONFIG_EXPR_MATH_SUPPORT_64
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
X-List-Received-Date: Thu, 19 Jan 2012 10:37:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 19 jan. 2012, om 10:22 heeft Saul Wold het volgende geschreven:

> From: Andrei Gherzan <andrei.gherzan@windriver.com>
> 
> Enable 64-bit math support in the expr applet. This will make
> the applet slightly larger, but will allow computation with very
> large numbers.

So it finally supports yocto now?


