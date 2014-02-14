Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 5096F6EADD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 16:42:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.95,845,1384297200"; d="scan'208";a="41198971"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 14 Feb 2014 17:42:34 +0100
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	(TLS) id 14.2.318.1; Fri, 14 Feb 2014 17:42:33 +0100
Received: from COSNADEXC13.usr.ingenico.loc ([169.254.1.243]) by
	COSNADEXC12.usr.ingenico.loc ([10.31.4.212]) with mapi id
	14.02.0328.009; Fri, 14 Feb 2014 17:42:33 +0100
From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v1] recipes: convert remaining
	SUMMARY/DESCRIPTION	cosmetic issues
Thread-Index: AQHPKaNdevSbwDB690iC0LGH2zXiFpq08/nw
Date: Fri, 14 Feb 2014 16:42:33 +0000
Message-ID: <8672BB614B4CCA40A6B3BDD6FD82050B57540E22@COSNADEXC13.usr.ingenico.loc>
References: <1392395660-28806-1-git-send-email-Matthieu.Crapet@ingenico.com>
In-Reply-To: <1392395660-28806-1-git-send-email-Matthieu.Crapet@ingenico.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.31.16.119]
MIME-Version: 1.0
Subject: Re: [PATCH v1] recipes: convert remaining SUMMARY/DESCRIPTION	cosmetic issues
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
X-List-Received-Date: Fri, 14 Feb 2014 16:42:33 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,=20

Few explanations ;) Seen in:
https://wiki.yoctoproject.org/wiki/Janitors

Didn't find any opened bugtracker.

These recipes are "pending", i.e. 80 < len(SUMMARY) < 95:

meta/recipes-support/libunistring/libunistring_0.9.3.bb
meta/recipes-devtools/devel-config/nfs-export-root.bb
meta/recipes-devtools/autogen/autogen-native_5.18.2.bb

Should I translate them to DESCRIPTION ?

Regards,
Matthieu

