Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 6138165C91
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 13:58:02 +0000 (UTC)
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX03.enea.se ([fe80::6ce7:7b51:1edf:e245%17]) with mapi id
	14.03.0158.001; Wed, 5 Nov 2014 14:58:01 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [OE-core] [PATCH] openssl: Fix for CVE-2014-3566
Thread-Index: AQHP+PNdmhipDIN+CkCMMQMkQLK4PZxR5XmAgAAQ+RD///lEAIAAHw4A
Date: Wed, 5 Nov 2014 13:58:01 +0000
Message-ID: <3230301C09DEF9499B442BBE162C5E482577C6A3@SESTOEX04.enea.se>
References: <1415190193-40532-1-git-send-email-sona.sarmadi@enea.com>
	<5425666.uucE3BEg2m@peggleto-mobl5.ger.corp.intel.com>
	<3230301C09DEF9499B442BBE162C5E482577C41F@SESTOEX04.enea.se>
	<20141105130536.GA2457@jama>
In-Reply-To: <20141105130536.GA2457@jama>
Accept-Language: sv-SE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.142.231]
MIME-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Fix for CVE-2014-3566
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
X-List-Received-Date: Wed, 05 Nov 2014 13:58:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> > git send-email --to=3Dopenembedded-core@lists.openembedded.org
> > --confirm=3Dalways  --subject-prefix=3D"dora][PATCH" 000*
>=20
> Because you're sending already generated files (000*), it works only when
> you specify git revisions (e.g. -1 my_branch).
>=20
> Or you need to pass --subject-prefix when you're calling git format-patch=
 to
> generate them.
>=20
Ah, I see, thanks. I will send a new patch.

--Sona

