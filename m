Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>)
	id 1Ruo4P-0000v2-Ea; Tue, 07 Feb 2012 17:39:05 +0100
Received: by werc1 with SMTP id c1so5764980wer.6
	for <multiple recipients>; Tue, 07 Feb 2012 08:31:03 -0800 (PST)
Received: by 10.180.92.71 with SMTP id ck7mr44940926wib.3.1328632262950;
	Tue, 07 Feb 2012 08:31:02 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id p10sm33684783wic.0.2012.02.07.08.31.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 08:31:02 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F314FEC.6090108@linux.intel.com>
Date: Tue, 7 Feb 2012 17:30:57 +0100
Message-Id: <20B10005-55FA-4F16-AB6D-BF7EEA077322@dominion.thruhere.net>
References: <29270F77-234D-4561-974D-C8E266898FA3@beagleboard.org>
	<4F314FEC.6090108@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [meta-openembedded][RFC] meta-multimedia layer
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
X-List-Received-Date: Tue, 07 Feb 2012 16:39:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 7 feb. 2012, om 17:23 heeft Joshua Lock het volgende geschreven:

>=20
>=20
> On 07/02/12 03:08, Koen Kooi wrote:
>> Hi,
>>=20
>> During FOSDEM Paul Eggleton and I discussed moving a few multimedia =
recipes (libav, xbmc, faac, faad, etc) out of meta-oe into a new =
meta-multimedia layer hosted in the meta-openembedded git repo. This =
would allow e.g. meta-baryon to drop a number of recipes while avoiding =
the need to drag in the complete meta-oe layer.
>>=20
>> Thoughts?
>=20
> Yes please!
>=20
> Would this layer be open to patches to enable =
LICENSE_FLAGS/INCOMPATIBLE_LICENSE ?

Certainly!=


