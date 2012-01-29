Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RrWv3-0004O5-7y
	for openembedded-core@lists.openembedded.org;
	Sun, 29 Jan 2012 16:43:53 +0100
Received: by werc1 with SMTP id c1so2749178wer.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jan 2012 07:36:01 -0800 (PST)
Received: by 10.216.139.204 with SMTP id c54mr5749947wej.13.1327851361556;
	Sun, 29 Jan 2012 07:36:01 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id t15sm24350467wiv.6.2012.01.29.07.36.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Jan 2012 07:36:00 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1327847180-25415-1-git-send-email-ulf@emagii.com>
Date: Sun, 29 Jan 2012 16:35:56 +0100
Message-Id: <59F89C99-2B25-4679-A565-B108ACAF1BFC@dominion.thruhere.net>
References: <1327847180-25415-1-git-send-email-ulf@emagii.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH] mirrors.bbclass: Add new KERNELORG_MIRROR = ftp.sunet.se
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
X-List-Received-Date: Sun, 29 Jan 2012 15:43:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 29 jan. 2012, om 15:26 heeft Ulf Samuelsson het volgende geschreven:

> www.kernel.org is missing a lot of files.
> Add the "ftp.sunet.se" mirror containing many missing files.

Since the files on kernel.org were removed because they might be =
compromised, why do we add a mirror that has kept the compromised files?=


