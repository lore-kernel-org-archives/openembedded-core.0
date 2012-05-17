Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SV4Ll-00075o-2p
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 19:18:53 +0200
Received: by wgbdr1 with SMTP id dr1so1792083wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 10:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=060E03XAHukS1M8z7Xc0eomDiQk3K8Z/eOlb4VjF9Mo=;
	b=DlmJNzUa8KL0JYKaEiMGmIMLZs1JCPRJ19NW0sqllL8V9r6daswnbKE70yDLJLfjro
	IKz9Sdreq/kB8bv5uI/Rk+lHmpRKVsVN6DijKtw3Rn795LEfoZ7w3WDHaNfFSKOM9vAd
	QZZi0/w83/vp7oNgyTUalKc6+AkrHOK4NSdDTelIiJrLXl5Ti/2c/2xslxfH/CgRU3T+
	P9xJJv5VJ5GqIDlWEln/2KVifkpnfrSrbPX6NteWr6ex9KdkF/kaKnJrQ2CKlGG47lAz
	HczFuzEdlGT9U+j3aX7v13RbU8TLVFRVsxPEa1h+dF+QsZBfA8Awvrl+gMR2moLW1cJj
	j3VA==
Received: by 10.180.84.193 with SMTP id b1mr40124935wiz.11.1337274530361;
	Thu, 17 May 2012 10:08:50 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id r2sm22806841wif.7.2012.05.17.10.08.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 May 2012 10:08:48 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1337273095.git.sgw@linux.intel.com>
Date: Thu, 17 May 2012 19:08:35 +0200
Message-Id: <8D610C53-D313-4323-A84A-0A2D4BA2CF8E@dominion.thruhere.net>
References: <cover.1337273095.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQm8+CweMJVmBlJHultC98nhDhqJ0hJ7QBAyAYI3SavUCs83qr4bqb8BIFuJBK7H1U+Y5Odf
Subject: Re: [CONSOLIDATED PULL 00/12] Updated and Fixes
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
X-List-Received-Date: Thu, 17 May 2012 17:18:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 17 mei 2012, om 18:51 heeft Saul Wold het volgende geschreven:

> Richard,
>=20
> Pull in the backlog of changes from this week.  Bigest change
> that need looking at are Chris's.

Where's the kmod fix? Does udev 182 need to remain unbuildable for =
another week?=


