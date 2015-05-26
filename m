Return-Path: <prvs=58172eb16=Mikko.Rapeli@bmw.de>
X-Greylist: delayed 592 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 26 May 2015 15:08:00 UTC
Received: from esa2.bmw.c3s2.iphmx.com (esa2.bmw.c3s2.iphmx.com
	[68.232.133.169])
	by mail.openembedded.org (Postfix) with ESMTP id 117556AC12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 15:08:00 +0000 (UTC)
Authentication-Results: esa2.bmw.c3s2.iphmx.com;
	dkim=neutral (message not signed) header.i=none
Received-SPF: None (esa2.bmw.c3s2.iphmx.com: no sender
	authenticity information available from domain of
	Mikko.Rapeli@bmw.de) identity=pra; client-ip=160.46.252.35;
	receiver=esa2.bmw.c3s2.iphmx.com;
	envelope-from="Mikko.Rapeli@bmw.de";
	x-sender="Mikko.Rapeli@bmw.de"; x-conformance=sidf_compatible
Received-SPF: None (esa2.bmw.c3s2.iphmx.com: no sender
	authenticity information available from domain of
	Mikko.Rapeli@bmw.de) identity=mailfrom;
	client-ip=160.46.252.35; receiver=esa2.bmw.c3s2.iphmx.com;
	envelope-from="Mikko.Rapeli@bmw.de";
	x-sender="Mikko.Rapeli@bmw.de"; x-conformance=sidf_compatible
Received-SPF: None (esa2.bmw.c3s2.iphmx.com: no sender
	authenticity information available from domain of
	postmaster@esagw3.muc) identity=helo;
	client-ip=160.46.252.35; receiver=esa2.bmw.c3s2.iphmx.com;
	envelope-from="Mikko.Rapeli@bmw.de";
	x-sender="postmaster@esagw3.muc"; x-conformance=sidf_compatible
X-IronPort-AV: E=Sophos;i="5.13,498,1427752800"; d="scan'208";a="44332287"
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35])
	by esa2.bmw.c3s2.iphmx.com with ESMTP/TLS/DHE-RSA-CAMELLIA256-SHA;
	26 May 2015 16:58:08 +0200
Received: from unknown (HELO esabb6.muc) ([160.50.100.50])
	by esagw3.muc with ESMTP/TLS/DHE-RSA-CAMELLIA256-SHA;
	26 May 2015 16:58:04 +0200
X-IronPort-AV: E=Sophos;i="5.13,498,1427752800"; 
   d="scan'208";a="936051"
Received: from smuch58b.muc (HELO SMUCH58B.europe.bmw.corp) ([160.46.137.108])
	by esabb6.muc with ESMTP/TLS/AES128-SHA; 26 May 2015 16:58:04 +0200
Received: from SMUCM65A.europe.bmw.corp ([160.46.134.155]) by
	SMUCH58B.europe.bmw.corp ([160.46.137.108]) with mapi id 14.03.0224.002;
	Tue, 26 May 2015 16:58:04 +0200
From: <Mikko.Rapeli@bmw.de>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] buildhistory: set commit user name and email for the
	new git repo
Thread-Index: AQHQksih4WI/vOwVykCmcGf7GX9A8Z2OQaKA
Date: Tue, 26 May 2015 14:58:02 +0000
Message-ID: <20150526145803.GD12838@loska>
References: <1432104329-6352-1-git-send-email-mikko.rapeli@bmw.de>
In-Reply-To: <1432104329-6352-1-git-send-email-mikko.rapeli@bmw.de>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.44.101]
MIME-Version: 1.0
Subject: Re: [PATCH] buildhistory: set commit user name and email for the new git repo
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
X-List-Received-Date: Tue, 26 May 2015 15:08:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <65729772A4C44F4FBE90A46B7FD4D187@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Already fixed by merged commit:

http://git.openembedded.org/openembedded-core/commit/?id=3Df62255bfa6c5a322=
c867b7c4ea5686ea7bfab3fe

-Mikko=

