Return-Path: <Muhammad_Shakeel@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id F08126A5AF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 14:50:32 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1UtfR3-0001aL-Mn from Muhammad_Shakeel@mentor.com ;
	Mon, 01 Jul 2013 07:50:33 -0700
Received: from SVR-IES-FEM-04.mgc.mentorg.com ([137.202.0.110]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 1 Jul 2013 07:50:33 -0700
Received: from EU-MBX-04.mgc.mentorg.com ([169.254.4.127]) by
	SVR-IES-FEM-04.mgc.mentorg.com ([137.202.0.110]) with mapi id
	14.02.0247.003; Mon, 1 Jul 2013 15:50:32 +0100
From: "Shakeel, Muhammad" <Muhammad_Shakeel@mentor.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] [dylan] lighttpd: Enabling with systemd
Thread-Index: AQHObQz69f1+gqygI06i3jpA/8F5Q5lLI4kUgAR1yQCAAF/K6Q==
Date: Mon, 1 Jul 2013 14:49:51 +0000
Message-ID: <A8A2F4C5E3D3D0468DDA3544476725F8AE1F720C@EU-MBX-04.mgc.mentorg.com>
References: <1371660580-4754-1-git-send-email-muhammad_shakeel@mentor.com>
	<A8A2F4C5E3D3D0468DDA3544476725F8AE1F5519@EU-MBX-04.mgc.mentorg.com>,
	<19067624.GhNbuypGS2@helios>
In-Reply-To: <19067624.GhNbuypGS2@helios>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.68]
MIME-Version: 1.0
X-OriginalArrivalTime: 01 Jul 2013 14:50:33.0708 (UTC)
	FILETIME=[56E98AC0:01CE766A]
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [dylan] lighttpd: Enabling with systemd
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
X-List-Received-Date: Mon, 01 Jul 2013 14:50:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

=0A=
________________________________________=0A=
From: Paul Eggleton [paul.eggleton@linux.intel.com]=0A=
Sent: Monday, July 01, 2013 3:02 PM=0A=
To: Shakeel, Muhammad=0A=
Cc: Saul Wold; openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] [PATCH] [dylan] lighttpd: Enabling with systemd=0A=
=0A=
On Friday 28 June 2013 13:01:15 Shakeel, Muhammad wrote:=0A=
> From: Muhammad Shakeel <muhammad_shakeel@mentor.com>=0A=
>=0A=
> +        file://lighttpd.service \=0A=
=0A=
> You've added a reference to lighttpd.service, but the patch does not add =
it.=0A=
=0A=
That's what I realized right after sending this patch. I have already sent =
a v2.=0A=
Please ignore this and see: http://patches.openembedded.org/patch/52027/=0A=
=0A=
Best Regards,=0A=
Shakeel=0A=
=0A=

