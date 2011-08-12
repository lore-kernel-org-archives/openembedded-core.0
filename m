Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QrqaS-00038P-Nv
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 14:11:40 +0200
Received: by wwe32 with SMTP id 32so2580904wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2011 05:07:08 -0700 (PDT)
Received: by 10.216.167.66 with SMTP id h44mr755581wel.21.1313150827986;
	Fri, 12 Aug 2011 05:07:07 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id i51sm1348990wed.19.2011.08.12.05.07.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 12 Aug 2011 05:07:07 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <201108121147.58438.paul.eggleton@linux.intel.com>
Date: Fri, 12 Aug 2011 14:07:05 +0200
Message-Id: <9A00A881-7C5C-4053-BEDF-DE26572945C6@dominion.thruhere.net>
References: <CAGiJk9fq+p3LcBOOz=V+_kprRppAOR-nOAOW6tgK3zwE78Skwg@mail.gmail.com>
	<201108121008.03554.paul.eggleton@linux.intel.com>
	<CAGiJk9dGQ5N0xd+L81Bit-jp4YDYPwSBjNvn5_io38vyH2nREg@mail.gmail.com>
	<201108121147.58438.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: Questions about the layer structure in OpenEmbedded-Core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Aug 2011 12:11:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 12 aug. 2011, om 12:47 heeft Paul Eggleton het volgende geschreven:

> On Friday 12 August 2011 10:31:12 you wrote:
>> 2011/8/12 Paul Eggleton <paul.eggleton@linux.intel.com>:
>>> I wrote both of these with input from the community recently, so they
>>> should be fairly reliable and up-to-date - was there something missing
>>> that you noticed? Suggestions welcome.
>> 
>> Maybe these are not from OpenEmbedded (or newer than the update) but I
>> got additionally items, which where provided by the setup script:
>> meta-efikamx, meta-openpandora (openpandora may come somewhere from
>> angstrom) and meta-xilinx.
> 
> Right, I have now added those to the layer index. Thanks!

There's also:

https://github.com/ebutera/meta-igep
http://gitorious.org/schnitzeltony-oe-meta/meta-freescale
http://gitorious.org/schnitzeltony-oe-meta/meta-gumstix
https://github.com/koenkooi/meta-ettus

and likely much more





