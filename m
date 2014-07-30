Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (unknown [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 8305A65ED3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 08:31:57 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 30 Jul 2014 10:31:52 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 68499288F33;
	Wed, 30 Jul 2014 10:31:52 +0200 (CEST)
Date: Wed, 30 Jul 2014 10:31:52 +0200
From: "Maxin B. John" <maxin.john@enea.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20140730083152.GA57938@sestofb10.enea.se>
References: <1406633242-28359-1-git-send-email-maxin.john@enea.com>
	<CAMKF1socScY49GgMLArdeD-D3Au_DPYw+mR75MeaOBaWwTSnrg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1socScY49GgMLArdeD-D3Au_DPYw+mR75MeaOBaWwTSnrg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] i2c-tools: Uprev to 3.1.1
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
X-List-Received-Date: Wed, 30 Jul 2014 08:32:05 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Khem,

On Tue, Jul 29, 2014 at 10:55:06PM -0700, Khem Raj wrote:
> On Tue, Jul 29, 2014 at 4:27 AM, Maxin B. John <maxin.john@enea.com> wrote:
> > +SRC_URI = "http://dl.lm-sensors.org/i2c-tools/releases/${PN}-${PV}.tar.bz2 \
> 
> use BP instead of PN-PV

Thanks for the review. I will update it and send a v2.

Best Regards,
Maxin

