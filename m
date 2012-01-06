Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RjC1D-0000Qe-G0
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 16:47:47 +0100
Received: by wibhq7 with SMTP id hq7so1290337wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2012 07:40:23 -0800 (PST)
Received: by 10.180.76.233 with SMTP id n9mr8069382wiw.14.1325864423542;
	Fri, 06 Jan 2012 07:40:23 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235]) by mx.google.com with ESMTPS id
	fo18sm68699376wbb.12.2012.01.06.07.40.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 Jan 2012 07:40:22 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F06F66D.8030703@mlbassoc.com>
Date: Fri, 6 Jan 2012 16:40:21 +0100
Message-Id: <494F3559-8F44-45CC-A15A-31490AE95122@dominion.thruhere.net>
References: <4F06F66D.8030703@mlbassoc.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH] webkit-gtk: Fix build
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
X-List-Received-Date: Fri, 06 Jan 2012 15:47:47 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 6 jan. 2012, om 14:26 heeft Gary Thomas het volgende geschreven:

> This version (introduced in commit =
663c893b084333ea9703079a9b056d74ffa5e2a3)
> can only build if GL support is present.  This change enables that =
support
> explicitly.

Isn't there a --disable-webgl option to keep feature parity with the old =
releases?=


