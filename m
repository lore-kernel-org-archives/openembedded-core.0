Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id B0B0C76D96
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 01:48:17 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3nHJ352pygz3hj0g;
	Fri, 18 Sep 2015 03:48:17 +0200 (CEST)
X-Auth-Info: WUDgk9egMlPpSeulwhD5uckNuKAVrNFTeY90t7kzRN0=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3nHJ350ST9zvdWS; 
	Fri, 18 Sep 2015 03:48:17 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Sep 2015 03:47:32 +0200
User-Agent: KMail/1.13.7 (Linux/3.14-2-amd64; KDE/4.13.1; x86_64; ; )
References: <1442500317-9064-1-git-send-email-marex@denx.de>
	<7502171E-B73E-4C1D-930B-B7EBBE881446@gmail.com>
In-Reply-To: <7502171E-B73E-4C1D-930B-B7EBBE881446@gmail.com>
MIME-Version: 1.0
Message-Id: <201509180347.32474.marex@denx.de>
Cc: lftan@altera.com, waltergoossens@home.nl,
	openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Fri, 18 Sep 2015 01:48:17 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Friday, September 18, 2015 at 03:44:54 AM, Khem Raj wrote:
> > On Sep 17, 2015, at 7:31 AM, Marek Vasut <marex@denx.de> wrote:
> > 
> > This patchset fixes various minor issues found during the process
> > of getting Yocto working with the Altera NIOS2 soft-processor.
> 
> Looks ok to me with few nits. But the changes are self contained which is
> less risk for other arches

Thanks! I'll wait a bit for further feedback and repost afterward.

Best regards,
Marek Vasut

