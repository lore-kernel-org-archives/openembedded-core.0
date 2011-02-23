Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PsCah-0003SR-Li
	for openembedded-core@lists.linuxtogo.org;
	Wed, 23 Feb 2011 12:09:08 +0100
Received: by wwb29 with SMTP id 29so318249wwb.6
	for <openembedded-core@lists.linuxtogo.org>;
	Wed, 23 Feb 2011 03:07:48 -0800 (PST)
Received: by 10.227.152.131 with SMTP id g3mr3465103wbw.107.1298459268204;
	Wed, 23 Feb 2011 03:07:48 -0800 (PST)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id r6sm3094420weq.44.2011.02.23.03.07.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Feb 2011 03:07:47 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <D9C39E6A-9CDE-49D3-B159-DB93CD26CAA1@dominion.thruhere.net>
Date: Wed, 23 Feb 2011 12:07:45 +0100
Message-Id: <16E7BBC5-39A5-414C-B87E-C157111F57AD@dominion.thruhere.net>
References: <8E7ADF40-9602-40FD-8298-636A5EF72740@dominion.thruhere.net>
	<20110221192352.GD10070@sakrah.homelinux.org>
	<D9C39E6A-9CDE-49D3-B159-DB93CD26CAA1@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.linuxtogo.org>
X-Mailer: Apple Mail (2.1082)
Subject: Re: Repo status
X-BeenThere: openembedded-core@lists.linuxtogo.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.linuxtogo.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.linuxtogo.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.linuxtogo.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.linuxtogo.org>
List-Help: <mailto:openembedded-core-request@lists.linuxtogo.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.linuxtogo.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Feb 2011 11:09:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 22 feb 2011, om 19:37 heeft Koen Kooi het volgende geschreven:

>=20
> Op 21 feb 2011, om 20:23 heeft Khem Raj het volgende geschreven:
>=20
>> On (21/02/11 09:31), Koen Kooi wrote:
>>> Hi,
>>>=20
>>> What's the status on the oe-core repo?
>>>=20
>>=20
>> I have it setup. I have also a local copy of yocto ready to be pushed =
to
>> populate it. I have only removed bitbake from it thus far. I did not
>> push it since I thought to do it after todays meeting and if there =
were
>> more to come in this regard.
>=20
> Thanks for the update! I'm asking this because I want to get =
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/setup-scripts/log/?h=
=3Doe-core into shape so I can have people use that to setup all the =
layers and do test builds.


Thanks to Richards hint of setting BBFETCH2 in shell env the script can =
now build console-image using bitbake master. So angstrom is in a good =
shape when OE-core goes live :)

regards,

Koen=


