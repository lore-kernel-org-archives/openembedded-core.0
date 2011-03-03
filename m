Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PvBIT-00073v-UK
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 17:22:38 +0100
Received: by wwb29 with SMTP id 29so97367wwb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2011 08:21:08 -0800 (PST)
Received: by 10.216.24.132 with SMTP id x4mr826491wex.81.1299169268553;
	Thu, 03 Mar 2011 08:21:08 -0800 (PST)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id m6sm662179wej.34.2011.03.03.08.21.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Mar 2011 08:21:07 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <AANLkTikgTx8SWJ1CpZgW=vgJYzrzveMsMMLUopHC57K8@mail.gmail.com>
Date: Thu, 3 Mar 2011 17:21:06 +0100
Message-Id: <A19EFEE9-7A3B-479B-B336-FF46C74B77FA@dominion.thruhere.net>
References: <394EA6D4-E718-4BE7-93A2-6AF67AAF6E0D@dominion.thruhere.net>
	<AANLkTikgTx8SWJ1CpZgW=vgJYzrzveMsMMLUopHC57K8@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1082)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: lots of WARNING: QA Issue: Bit size did not match (32 to 0) warnings, what do they mean?
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
X-List-Received-Date: Thu, 03 Mar 2011 16:22:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 mrt 2011, om 16:53 heeft Khem Raj het volgende geschreven:

> On Thu, Mar 3, 2011 at 7:45 AM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>> Hi,
>>=20
>> I started noticing a lot of warnings like this:
>>=20
>> WARNING: QA Issue: Bit size did not match (32 to 0) on =
/work/armv7a-angstrom-linux-gnueabi/udev-165-r2/packages-split/udev/sbin/u=
devd
>>=20
>> What do they mean and how can I (help to) fix them?
>>=20
>=20
> Its found due to f17c84c9b1cba52f860752058821b31930674e1a
> probably can you post the binary so I can take a look

WARNING: QA Issue: Bit size did not match (32 to 0) on =
/work/armv7a-angstrom-linux-gnueabi/udev-165-r2/packages-split/udev/sbin/u=
devd

can be found at:

http://dominion.thruhere.net/koen/angstrom/stuff/udevd

regards,

koen=


