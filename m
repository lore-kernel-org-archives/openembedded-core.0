Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E25CE607BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 09:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6D97oXW018928; Mon, 13 Jul 2015 10:07:50 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uyhN0qNBTzOo; Mon, 13 Jul 2015 10:07:50 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6D97bN1018892
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 13 Jul 2015 10:07:48 +0100
Message-ID: <1436778457.3310.38.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jens Rehsack <rehsack@gmail.com>
Date: Mon, 13 Jul 2015 10:07:37 +0100
In-Reply-To: <635A9611-7B0D-4FB0-A643-88ACFAEE4C27@gmail.com>
References: <3EECF939-15F6-43A4-BE87-CC1D57121CD1@gmail.com>
	<CAJTo0LZkMtES=kPa17dV_Sb6P3RYhdGhTK=iuLfJymzykvTBzw@mail.gmail.com>
	<635A9611-7B0D-4FB0-A643-88ACFAEE4C27@gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Update rrdtool from 1.4.8 to 1.5.3
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
X-List-Received-Date: Mon, 13 Jul 2015 09:07:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-07-13 at 09:57 +0200, Jens Rehsack wrote:
> > Am 10.07.2015 um 21:50 schrieb Burton, Ross <ross.burton@intel.com>:
> > 
> > 
> > On 9 July 2015 at 17:38, Jens Rehsack <rehsack@gmail.com> wrote:
> > here is an update patch for meta-oe/recipes-extended/rrdtool:
> > https://github.com/rehsack/meta-openembedded/commit/6ed5b4489beb1233bd4b3c9f73064e973eeef2ad
> > 
> > Please send the actual patch instead of a link to the patch, and meta-oe patches go to openembedded-devel@ not -core@.
> 
> I was told by RP that sending patches via GitHub is fine. Unfortunately that's the best I can do.
> When it's clear how to submit patches, I'll go ahead to oe-devel@

Not sure I said github was ok. What I perhaps would have said is that
posting a link to such patches was better than not having anything at
all. There are some good improvements in there for perl and as you know,
our perl skills are a bit lacking :).

Our commit process is patches on the mailing list for review. If you
can't help with that, it means someone else will have to step up and do
that piece. Its then going to come down to how good the patches are as
to whether anyone does.

As I have said, I'd much rather know about them and have the option
rather than not know about them at all though.

Cheers,

Richard




