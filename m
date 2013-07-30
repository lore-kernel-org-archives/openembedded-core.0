Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 0CD026B3FA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 16:10:34 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1V4CVO-0004PK-Bz; Tue, 30 Jul 2013 18:10:34 +0200
Message-ID: <1375200633.8017.29.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Laszlo Papp <lpapp@kde.org>
Date: Tue, 30 Jul 2013 17:10:33 +0100
In-Reply-To: <CAOMwXhPw4K+T82qs21UzFFT+-eCYz9vBRVfUNGs5smmHCTP=VQ@mail.gmail.com>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<1375092018.6324.176.camel@phil-desktop.brightsign>
	<CAOMwXhNqXneU6UzeHZJJVM++RmNmmdvNMp3mbNV=YpFVE6tOdw@mail.gmail.com>
	<1375093253.13247.5.camel@phil-desktop.brightsign>
	<CAOMwXhO6+sJWjKAKVh=y1gymGoSUNVgs+nV9fz8G8eo9WHyAkw@mail.gmail.com>
	<1375094111.13247.9.camel@phil-desktop.brightsign>
	<CAOMwXhMZ1w5j=aP_yPXb=k0=UOuinMS5ENAsXAdzcb42WxC0Og@mail.gmail.com>
	<CAOMwXhO2A75jPxM4FdU=XBgVRjsxW24hDVLOf8eub2Wp4CmGDA@mail.gmail.com>
	<1402aa377f6.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
	<CAOMwXhOjyAtjsRbiHT3ufeApZVvkEE47pgBhXDsE0wxeHOZJiQ@mail.gmail.com>
	<1402b178308.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
	<CAOMwXhPw4K+T82qs21UzFFT+-eCYz9vBRVfUNGs5smmHCTP=VQ@mail.gmail.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox-1.21.1/defconfig: disable rfkill
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
X-List-Received-Date: Tue, 30 Jul 2013 16:10:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-07-30 at 16:55 +0100, Laszlo Papp wrote:

> At any rate, can someone provide a helper change from the past for
> PACKAGEGROUP like changes?

Do you mean PACKAGECONFIG?  If so, just run "git log" in your oe-core
tree and search for PACKAGECONFIG.

p.




