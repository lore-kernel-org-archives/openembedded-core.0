Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QRqBZ-0005am-4G
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 20:30:29 +0200
Received: by wye20 with SMTP id 20so77130wye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jun 2011 11:27:18 -0700 (PDT)
Received: by 10.216.50.10 with SMTP id y10mr4155206web.21.1306952838345;
	Wed, 01 Jun 2011 11:27:18 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id z66sm793171weq.0.2011.06.01.11.27.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Jun 2011 11:27:17 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1306952390.14389.1.camel@lenovo.internal.reciva.com>
Date: Wed, 1 Jun 2011 20:27:15 +0200
Message-Id: <A58DF9E1-A81F-41E0-B687-CFBB3FE66E82@dominion.thruhere.net>
References: <cover.1306909184.git.sgw@linux.intel.com>
	<f1c4bd3cef1b384787b418e737c93cd105635196.1306909184.git.sgw@linux.intel.com>
	<1306949369.27470.443.camel@rex>
	<1306952390.14389.1.camel@lenovo.internal.reciva.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [CONSOLIDATED PULL 24/32] bitbake.conf: Create static-dev pacakge for static libraries
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
X-List-Received-Date: Wed, 01 Jun 2011 18:30:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 jun 2011, om 20:19 heeft Phil Blundell het volgende geschreven:

> On Wed, 2011-06-01 at 18:29 +0100, Richard Purdie wrote:
>> I've also a slight preference for "staticdev" just to make these =
clearly
>> different from -dev packages.
>=20
> Agreed.  I think even "-static" might be better still.

That's what we did in OE and it caused some troubles in the =
busybox-static and mplayer-static cases. But that were the only ones I =
encountered.

regards,

Koen=20=


