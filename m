Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RR5Xl-0006Ei-La
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 18:14:33 +0100
Received: by wyg8 with SMTP id 8so2350073wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 09:08:08 -0800 (PST)
Received: by 10.180.14.129 with SMTP id p1mr41695903wic.8.1321549688465;
	Thu, 17 Nov 2011 09:08:08 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id e7sm37417944wbh.12.2011.11.17.09.08.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Nov 2011 09:08:06 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <ba16511184b69e183eaa2030579183eddb87309b.1321548812.git.nitin.a.kamble@intel.com>
Date: Thu, 17 Nov 2011 18:08:07 +0100
Message-Id: <99EB44B0-0033-4DB0-ABCD-BD88EE9921F7@dominion.thruhere.net>
References: <cover.1321548812.git.nitin.a.kamble@intel.com>
	<ba16511184b69e183eaa2030579183eddb87309b.1321548812.git.nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 1/1] gmp: also generate the libgmpcxx library
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
X-List-Received-Date: Thu, 17 Nov 2011 17:14:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 17 nov. 2011, om 17:55 heeft nitin.a.kamble@intel.com het volgende =
geschreven:

> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>=20
> configure runs few checks to make sure c++ compiler and runtime are =
working as expected
> with the --enable-cxx=3Ddetect option.

Has the packaging issue been fixed already (e.g. LEAD_SONAME or a =
seperate package)?




