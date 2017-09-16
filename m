Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.221.74.143])
	by mail.openembedded.org (Postfix) with ESMTP id E84A1600EA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Sep 2017 17:59:36 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 7EB0D2ADC93;
	Sat, 16 Sep 2017 12:59:37 -0500 (CDT)
Date: Sat, 16 Sep 2017 12:59:36 -0500
From: Seebs <seebs@seebs.net>
To: Will Page <will.page@ni.com>
Message-ID: <20170916125936.04fcc729@seebsdell>
In-Reply-To: <CO2PR04MB619C119668833BC7B259C21916D0@CO2PR04MB619.namprd04.prod.outlook.com>
References: <20170915222700.GA15457@canismajor>
	<CAJTo0LbA_fr5bd8kAa-ma3zb4X8oEy3YUwrtqvSDjpAdNnxUow@mail.gmail.com>
	<CO2PR04MB619C119668833BC7B259C21916D0@CO2PR04MB619.namprd04.prod.outlook.com>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [pseudo][PATCH] Fix to fcntl guts to ignore flags that can be ORed into cmd
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
X-List-Received-Date: Sat, 16 Sep 2017 17:59:37 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 16 Sep 2017 02:22:01 +0000
Will Page <will.page@ni.com> wrote:

> Thanks, Ross.
> 
> I had contacted the maintainer off list to ask where I should submit
> my patch.  I may have misunderstood his reply.

No, I'm just confused, because I'm not really otherwise active in
yocto/oe-core these days, I just still know my way around pseudo. (And
I know I'm several patches behind on things, but I'm really hoping to
get some free time in a couple of weeks.)

-s

