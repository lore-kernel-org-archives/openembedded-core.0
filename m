Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1S9Rbv-0005QH-28
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 02:42:11 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 18 Mar 2012 18:33:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="78968754"
Received: from azsmsx603.amr.corp.intel.com ([10.2.161.23])
	by AZSMGA002.ch.intel.com with ESMTP; 18 Mar 2012 18:33:18 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	azsmsx603.amr.corp.intel.com (10.2.161.23) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Sun, 18 Mar 2012 18:33:18 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.36]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.91]) with mapi id
	14.01.0355.002; Mon, 19 Mar 2012 09:33:16 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] self-hosted-image: pre-populate	the
	builder user with poky source
Thread-Index: AQHNBP+6otTGrR9pSU6fIVTZlhG3tZZw1hrA
Date: Mon, 19 Mar 2012 01:33:16 +0000
Message-ID: <A25F549E4D43CD42B4C02DF47A1913230FCE1D0D@SHSMSX102.ccr.corp.intel.com>
References: <cover.1332049148.git.dexuan.cui@intel.com>
	<401c27ba4e7f8b5bc0da084cd48d1738157c894b.1332049148.git.dexuan.cui@intel.com>
	<84AFADF8-9F03-46C2-80EE-F9CDEE8991CF@dominion.thruhere.net>
	<A25F549E4D43CD42B4C02DF47A1913230FCE1B13@SHSMSX102.ccr.corp.intel.com>
	<2743E261-B779-4666-9370-B44D582E24BA@dominion.thruhere.net>
In-Reply-To: <2743E261-B779-4666-9370-B44D582E24BA@dominion.thruhere.net>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/1] self-hosted-image: pre-populate	the	builder user with poky source
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
X-List-Received-Date: Mon, 19 Mar 2012 01:42:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Koen Kooi wrote on 2012-03-18:
>=20
> Op 18 mrt. 2012, om 10:52 heeft Cui, Dexuan het volgende geschreven:
>=20
>> Koen Kooi wrote on 2012-03-18:
>>>=20
>>> Op 18 mrt. 2012, om 06:41 heeft Dexuan Cui het volgende geschreven:
>>>=20
>>>> [YOCTO #2065]
>>>=20
>>> What does that mean?
>> Sorry, I should have made it more clear. :-)
>>=20
>> It means bug 2065 is addressed by the patch:
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2065
>=20
> So add that and (part of) the bug description into the commit message
OK, please review and use the updated commit(only the commit description wa=
s updated):
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Ddcui/sel=
f&id=3D0882b5e0adb05d4f950c721fcb80b4cff42ce079

Thanks,
-- Dexuan



