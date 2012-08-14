Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1T1FRC-0007gV-Ei
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 13:37:30 +0200
Received: from localhost (193.41.119.134) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.245.1; Tue, 14 Aug 2012
	13:24:51 +0200
Date: Tue, 14 Aug 2012 13:25:43 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20120814112542.GA3444@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <1344934956-28631-1-git-send-email-radu.moisan@intel.com>
MIME-Version: 1.0
In-Reply-To: <1344934956-28631-1-git-send-email-radu.moisan@intel.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.20 (2009-12-10)
X-GFI-SMTP-Submission: 1
Subject: Re: [PATCH] busybox: Upgrade to upstream 1.20.2
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
X-List-Received-Date: Tue, 14 Aug 2012 11:37:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Radu Moisan <radu.moisan@intel.com> [120814 11:01]:

> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
>  .../B921600.patch                                  |    0
>  .../busybox-appletlib-dependency.patch             |    0
>  .../busybox-mkfs-minix-tests_bigendian.patch       |    0
>  .../busybox-udhcpc-no_deconfig.patch               |   37 +++++++++-----------
>  .../{busybox-1.19.4 => busybox-1.20.2}/defconfig   |    0

Are there no changes to the configuration file? I.e. new and removed
options?

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB


