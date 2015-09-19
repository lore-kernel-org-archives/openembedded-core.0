Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 0046976F58
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Sep 2015 21:38:10 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3nJQPX1ZPJz3hj9D;
	Sat, 19 Sep 2015 23:38:08 +0200 (CEST)
X-Auth-Info: LBbEpBT6YnSqfB7F797EkHG5YjhpUsLe11EhoiWorS4=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3nJQPW6P4dzvhTg; 
	Sat, 19 Sep 2015 23:38:07 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 19 Sep 2015 23:38:17 +0200
User-Agent: KMail/1.13.7 (Linux/3.14-2-amd64; KDE/4.13.1; x86_64; ; )
References: <1442500317-9064-1-git-send-email-marex@denx.de>
	<CAJTo0Lb3jFKOQqhV+PzOHUurauGRFFK55GufPt2isWABdvGCpg@mail.gmail.com>
In-Reply-To: <CAJTo0Lb3jFKOQqhV+PzOHUurauGRFFK55GufPt2isWABdvGCpg@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201509192338.17209.marex@denx.de>
Cc: lftan@altera.com, waltergoossens@home.nl,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/8] nios2 fixes
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
X-List-Received-Date: Sat, 19 Sep 2015 21:38:11 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thursday, September 17, 2015 at 09:54:26 PM, Burton, Ross wrote:
> On 17 September 2015 at 15:31, Marek Vasut <marex@denx.de> wrote:
> > This patchset fixes various minor issues found during the process
> > of getting Yocto working with the Altera NIOS2 soft-processor.
> 
> The patches all look good, but the patches which include changes to
> upstream need an Upstream-Status tag in the patch alongside your
> signed-off-by.
> 
> See http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines for
> details.

Roger that, V2 is coming, thanks !

Best regards,
Marek Vasut

