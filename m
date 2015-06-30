Return-Path: <gchoc-openembedded-core@m.gmane.org>
X-Greylist: delayed 901 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 30 Jun 2015 10:25:06 UTC
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 8384660088
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 10:25:06 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1Z9sUO-0007Me-6L for openembedded-core@lists.openembedded.org;
	Tue, 30 Jun 2015 12:10:04 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 12:10:04 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 12:10:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 30 Jun 2015 12:00:26 +0200
Message-ID: <mmtpbq$67d$2@ger.gmane.org>
References: <5591E548.8090706@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
In-Reply-To: <5591E548.8090706@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: cmake update broke mariadb
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
X-List-Received-Date: Tue, 30 Jun 2015 10:25:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

akuster808 schreef op 30-06-15 om 02:39:
> 
> Hello,
> 
> eo-core commit f8661aa "cmake: Upgrade 2.8.12.2 -> 3.2.2" broke mariadb
> in meta-oe.
> 
> DOes  the person who updated cmake need to fix this or the person who is 
> feeling the pain will be fixing it ?

I've been looking at this mariadb error and I've made no progress beyond
upgrading it to the latest 5.5.x, which shows the same cmake problem

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFVkmi6MkyGM64RGpERAmrsAJ0bCkH5omgOzpnB0dT8A6amMrYH6gCfU50x
ZObEl6kQHbI+QDeiui3GxfU=
=E2ZF
-----END PGP SIGNATURE-----


