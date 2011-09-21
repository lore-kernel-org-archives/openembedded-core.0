Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R6Jfb-00014O-Lt
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 12:04:47 +0200
Received: by fxi1 with SMTP id 1so1479441fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 02:59:29 -0700 (PDT)
Received: by 10.223.71.155 with SMTP id h27mr750900faj.126.1316599169558;
	Wed, 21 Sep 2011 02:59:29 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id n1sm3807527fad.20.2011.09.21.02.59.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 02:59:28 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <201109201340.17057.paul.eggleton@linux.intel.com>
Date: Wed, 21 Sep 2011 11:59:23 +0200
Message-Id: <BDE7C375-F773-4E02-950C-BCE41A7D86F0@dominion.thruhere.net>
References: <1316516896-6884-1-git-send-email-koen@dominion.thruhere.net>
	<201109201340.17057.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [RFC] bluez4: split gstreamer plugin into a seperate recipe
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
X-List-Received-Date: Wed, 21 Sep 2011 10:04:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 20 sep. 2011, om 14:40 heeft Paul Eggleton het volgende geschreven:

> On Tuesday 20 September 2011 12:08:16 Koen Kooi wrote:
>> This eliminates a good chunk of buildtime when building console-only =
image.
>>=20
>> The bluez4 and this recipe share a .inc file since the source is the =
same.
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>=20

[..]

> Looks good to me!
>=20
> Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Do I need to resend it without the 'RFC' prefix or can it go in as is?=


