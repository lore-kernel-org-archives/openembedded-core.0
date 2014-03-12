Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 7A3506B7A6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 09:28:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,636,1389740400"; d="scan'208";a="42545214"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 12 Mar 2014 10:28:37 +0100
Received: from COSNADEXC13.usr.ingenico.loc ([169.254.1.243]) by
	COSNADEXC21.usr.ingenico.loc ([10.31.4.221]) with mapi id
	14.02.0328.009; Wed, 12 Mar 2014 10:28:37 +0100
From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] oe-setup-builddir: small rework
Thread-Index: AQHPPdS6tyafb/1RHkm6MwgrONJgN5rdLmeQ
Date: Wed, 12 Mar 2014 09:28:36 +0000
Message-ID: <8672BB614B4CCA40A6B3BDD6FD82050B5754B2F6@COSNADEXC13.usr.ingenico.loc>
References: <1394581224-4752-1-git-send-email-sgw@linux.intel.com>
	<1394615726-32367-1-git-send-email-Matthieu.Crapet@ingenico.com>
In-Reply-To: <1394615726-32367-1-git-send-email-Matthieu.Crapet@ingenico.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.31.16.119]
MIME-Version: 1.0
Subject: Re: [PATCH] oe-setup-builddir: small rework
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
X-List-Received-Date: Wed, 12 Mar 2014 09:28:41 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Saul, I included your bashism fix in my patch.

I wanted to update copyright to something like:

# Copyright (C) 2012-2012 OpenEmbedded Team

but didn't know if this was appropriate.

Regards,
Matthieu

