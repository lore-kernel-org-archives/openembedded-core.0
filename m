Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1ReMHL-0002o7-95
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Dec 2011 08:44:27 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Dec 2011 23:37:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="89942784"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by orsmga001.jf.intel.com with ESMTP; 23 Dec 2011 23:37:17 -0800
Received: from pgsmsx102.gar.corp.intel.com (10.221.44.80) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Sat, 24 Dec 2011 15:37:17 +0800
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
	PGSMSX102.gar.corp.intel.com (10.221.44.80) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Sat, 24 Dec 2011 15:37:16 +0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.199]) by
	SHSMSX101.ccr.corp.intel.com ([169.254.1.38]) with mapi id
	14.01.0355.002; Sat, 24 Dec 2011 15:37:15 +0800
From: "Wang, Shane" <shane.wang@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 08/14] dbus: upgrade to 1.5.8
Thread-Index: AQHMwZJBPJ85GeL0tEKk+bg86aGl+ZXqmhcw
Date: Sat, 24 Dec 2011 07:37:14 +0000
Message-ID: <3AB6CE7F274E534CAFD089D127A8A1FC0104B2@SHSMSX102.ccr.corp.intel.com>
References: <b3dad82177ad19a44f06edc4b857cb9697fa3950.1324657801.git.shane.wang@intel.com>
	<730a89487990ac89b5cf86063d083d23a5501188.1324657801.git.shane.wang@intel.com>
	<BBCD5BBE-CFB6-4C49-A37C-AEC57D4A86B3@dominion.thruhere.net>
In-Reply-To: <BBCD5BBE-CFB6-4C49-A37C-AEC57D4A86B3@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [PATCH 08/14] dbus: upgrade to 1.5.8
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
X-List-Received-Date: Sat, 24 Dec 2011 07:44:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Koen Kooi wrote on=A02011-12-24:

>=20
> Op 23 dec. 2011, om 17:35 heeft Shane Wang het volgende geschreven:
>=20
>> Signed-off-by: Shane Wang <shane.wang@intel.com>
>> ---
>>=20
>> delete mode 100644 meta/recipes-core/dbus/dbus_1.4.16.bb
>> create mode 100644 meta/recipes-core/dbus/dbus_1.5.8.bb
>=20
> From the dbus website:
>=20
> The current stable branch is 1.4.x, and the latest stable release is D-Bu=
s
> 1.4.16 (2011-09-21). See the 1.4.16 release announcement.
> [..]
> The current development branch is 1.5.x, and the latest development relea=
se
> is D-Bus 1.5.8 (2011-09-21). See the 1.5.8 release announcement.
>=20
> Why is this switching dbus to the unstable branch?

Sorry, I am not aware of it but just find the version update from the packa=
ge report system.
Will remove the patch.

--
Shane


