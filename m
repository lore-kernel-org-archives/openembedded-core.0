Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 8C7E0701BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 12:10:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.01,748,1400018400"; d="scan'208";a="55618144"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 28 Jul 2014 14:10:20 +0200
Received: from COSNADEXC13.usr.ingenico.loc ([169.254.1.78]) by
	COSNADEXC21.usr.ingenico.loc ([10.31.4.221]) with mapi id
	14.03.0174.001; Mon, 28 Jul 2014 14:10:19 +0200
From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] libav: fix PACKAGECONFIG for theora and
	libvorbis
Thread-Index: AQHPqlzlU75rx/gXOkaxCAMln+URzQ==
Date: Mon, 28 Jul 2014 12:10:18 +0000
Message-ID: <8672BB614B4CCA40A6B3BDD6FD82050BAA13359C@COSNADEXC13.usr.ingenico.loc>
References: <8672BB614B4CCA40A6B3BDD6FD82050BA8B29DEA@COSNADEXC13.usr.ingenico.loc>
	<1406549213-4532-1-git-send-email-Matthieu.Crapet@ingenico.com>
In-Reply-To: <1406549213-4532-1-git-send-email-Matthieu.Crapet@ingenico.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.31.16.119]
MIME-Version: 1.0
Subject: Re: [PATCH] libav: fix PACKAGECONFIG for theora and libvorbis
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
X-List-Received-Date: Mon, 28 Jul 2014 12:10:25 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Please take this bugfix patch first, then we could arrange the LICENSE chan=
ge issue later.

Regards,
Matthieu

