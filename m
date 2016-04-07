Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5E2E273CF7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 17:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u37H4NHj006934; Thu, 7 Apr 2016 18:04:23 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id W_aPxJ_WI2B4; Thu,  7 Apr 2016 18:04:23 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u37H4KGE006931
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 7 Apr 2016 18:04:21 +0100
Message-ID: <1460048660.7348.274.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Thu, 07 Apr 2016 18:04:20 +0100
In-Reply-To: <C45DACC4-0F2A-450B-B17F-4A7A362876FB@dominion.thruhere.net>
References: <1445729978-29103-1-git-send-email-raj.khem@gmail.com>
	<C45DACC4-0F2A-450B-B17F-4A7A362876FB@dominion.thruhere.net>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] toasterconf.json: Set default distro to nodistro
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
X-List-Received-Date: Thu, 07 Apr 2016 17:04:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-04-07 at 09:42 -0700, Koen Kooi wrote:
> > Op 24 okt. 2015, om 16:39 heeft Khem Raj <raj.khem@gmail.com> het
> > volgende geschreven:
> > 
> > This makes it self-sufficient with OE-Core
> > Generate ext4 instead of ext3, most of Qemu
> > targets in oe-core now use ext4
> 
> Any reason this still hasn’t been applied yet?

It got lost in the system and a reminder helps. Its in -next now, sorry
about the delay.

Cheers,

Richard

