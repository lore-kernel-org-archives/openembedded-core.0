Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 783266080F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jul 2016 12:06:06 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 5240168A01C; Sat, 30 Jul 2016 13:06:06 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_40,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id DEB3568A019;
	Sat, 30 Jul 2016 13:06:05 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 2FBA2674036D;
	Sat, 30 Jul 2016 14:06:05 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <579C70FC.3040204@mlbassoc.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <579C982C.2060809@mlbassoc.com>
Date: Sat, 30 Jul 2016 14:06:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <579C70FC.3040204@mlbassoc.com>
Subject: Re: Strange udev error
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
X-List-Received-Date: Sat, 30 Jul 2016 12:06:07 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-07-30 11:18, Gary Thomas wrote:
> I just got this udev error  - anyone know what to make of it?
>    udevd[149]: no sender credentials received, message ignored
>
> Note: I'm running Poky/Yocto master (039f47ad) and I don't
> recall ever seeing this before and I only saw it on one target
> built from these sources, others didn't report it.
>
> Any pointers graciously accepted
>

BTW, I think this may be related to a cranky USB->ethernet
adapter I have, so if that's it, just let me know and I'll
move on...

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

