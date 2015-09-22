Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id EF65573CF2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 00:06:53 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3nKjcD63YSz3hjQN;
	Tue, 22 Sep 2015 02:06:52 +0200 (CEST)
X-Auth-Info: RHvsD2tQB3ZmtuPDeJoOJS6OWlhUlnAXM1fhx4GwoPA=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3nKjcD4JC4zvhTZ; 
	Tue, 22 Sep 2015 02:06:52 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 Sep 2015 02:06:52 +0200
User-Agent: KMail/1.13.7 (Linux/3.14-2-amd64; KDE/4.13.1; x86_64; ; )
References: <1442702597-5619-1-git-send-email-marex@denx.de>
	<201509211249.34740.marex@denx.de>
	<CAJTo0LbcO+Wz8=GwYKbM+6WiVaeOVqZo6iPo+gpErg1V0NH_LQ@mail.gmail.com>
In-Reply-To: <CAJTo0LbcO+Wz8=GwYKbM+6WiVaeOVqZo6iPo+gpErg1V0NH_LQ@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201509220206.52454.marex@denx.de>
Cc: lftan@altera.com, waltergoossens@home.nl,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/8] openssl: Add nios2 configuration
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
X-List-Received-Date: Tue, 22 Sep 2015 00:06:54 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Monday, September 21, 2015 at 02:38:52 PM, Burton, Ross wrote:
> On 21 September 2015 at 11:49, Marek Vasut <marex@denx.de> wrote:
> > This approach [1] is applicable to nios2 just fine, so I'll go with the
> > same. Can the rest of the patches here be applied, so I don't have to
> > repost them please ?
> 
> Absolutely, the rest of the series is queued in ross/mut already.

Thanks! I just sent the OpenSSL patch in reply to this mail, it's build
tested too.

Best regards,
Marek Vasut

