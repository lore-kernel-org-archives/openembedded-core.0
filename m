Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id F2CC978A50
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 08:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id A366D1839A;
	Mon, 11 Jun 2018 10:41:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id c8tDkQiAUik2; Mon, 11 Jun 2018 10:41:11 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 3598D183D9;
	Mon, 11 Jun 2018 10:41:11 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F33651E082;
	Mon, 11 Jun 2018 10:41:10 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E73491E080;
	Mon, 11 Jun 2018 10:41:10 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Mon, 11 Jun 2018 10:41:10 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id DBAE92DBB;
	Mon, 11 Jun 2018 10:41:10 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 11 Jun 2018 10:41:10 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Mon, 11 Jun 2018 10:41:10 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Anuj Mittal <anuj.mittal@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2] bitbake-blayers/create: add
	LAYERSERIES_COMPAT
Thread-Index: AQHUAV5qrnjxP6A6G06L1fuqGBQ2GKRauz+w
Date: Mon, 11 Jun 2018 08:41:10 +0000
Message-ID: <1128577de36d44109f83bf326038681e@XBOX02.axis.com>
References: <20180611015207.10465-2-anuj.mittal@intel.com>
	<20180611082901.28043-1-anuj.mittal@intel.com>
In-Reply-To: <20180611082901.28043-1-anuj.mittal@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH v2] bitbake-blayers/create: add LAYERSERIES_COMPAT
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
X-List-Received-Date: Mon, 11 Jun 2018 08:41:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Anuj Mittal
> Sent: den 11 juni 2018 10:29
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v2] bitbake-blayers/create: add LAYERSERIES_COM=
PAT
                                ^^^^^^^^^^^^^^^
I assume you mean "bitbake-layers"... This goes for the other=20
patch in the series as well.

//Peter


