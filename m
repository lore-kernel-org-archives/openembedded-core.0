Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 4B69F72491
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 21:08:58 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3lbwZK1NNTz3hhj9;
	Tue, 28 Apr 2015 23:08:56 +0200 (CEST)
X-Auth-Info: xwXl4uHf28KpN/7HX85Uq11rpF1owWcAw2bD9DknLQw=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3lbwZH0MMhzvdWV; 
	Tue, 28 Apr 2015 23:08:54 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Tue, 28 Apr 2015 22:06:57 +0200
User-Agent: KMail/1.13.7 (Linux/3.13-trunk-amd64; KDE/4.13.1; x86_64; ; )
References: <1430239116-7671-1-git-send-email-marex@denx.de>
	<553FD567.8010004@windriver.com>
In-Reply-To: <553FD567.8010004@windriver.com>
MIME-Version: 1.0
Message-Id: <201504282206.57552.marex@denx.de>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/8] Add basic fitImage support
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
X-List-Received-Date: Tue, 28 Apr 2015 21:09:05 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tuesday, April 28, 2015 at 08:45:59 PM, Bruce Ashfield wrote:
> On 2015-04-28 12:38 PM, Marek Vasut wrote:
> > This series cleans up the code in kernel.bbclass and
> > separates out the uImage generation. The 7th patch
> > in this series then adds support for generation of the
> > advanced successor of the uImage, the fitImage.
> > 
> > This series adds only very rudimentary support for
> > generation of fitImage. The advanced features might
> > be added in subsequent patches.
> 
> I read the series, and nothing fundamentally wrong jumps out.
> Just one comment and one question from me.

Wow, thanks!

Best regards,
Marek Vasut

