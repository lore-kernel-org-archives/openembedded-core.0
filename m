Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QozdY-0004Q5-UQ
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 17:15:05 +0200
Received: by pzk2 with SMTP id 2so1836550pzk.34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2011 08:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:organization:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding:content-type;
	bh=rK3pVEtiIj4P2/6FXt0nXoFV1FvYIV94QjiDwhJlzVE=;
	b=dk3GIH8n/5/ATy45YftSTvzACJG6Fnnd24b4Q9/VfqsSgI/P1uiJ/2I7h34nRV50N+
	3Zv2pm7kqDWmO0aTqag3Izx/6OwoGlsd3241ubJyBA7IFk02KcKgW5UzI5SyUgdp6nq3
	latHLwr/5YbJMKIaFf9qgLhC0tyZ2T/PlB9kU=
Received: by 10.142.169.19 with SMTP id r19mr956140wfe.33.1312470640268;
	Thu, 04 Aug 2011 08:10:40 -0700 (PDT)
Received: from perseus.localnet (natint3.juniper.net [66.129.224.36])
	by mx.google.com with ESMTPS id m12sm1271718wfh.19.2011.08.04.08.10.38
	(version=SSLv3 cipher=OTHER); Thu, 04 Aug 2011 08:10:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 04 Aug 2011 08:10:32 -0700
Message-ID: <2073777.2Ge9Hm0uQT@perseus>
Organization: Sakrah
User-Agent: KMail/4.7.0  (Linux/2.6.38-10-generic; KDE/4.7.0; i686; ; )
In-Reply-To: <1312449841.4325.95.camel@phil-desktop>
References: <1308219330.25285.4194.camel@phil-desktop>
	<4E0C885D.9000505@gmail.com>
	<1312449841.4325.95.camel@phil-desktop>
MIME-Version: 1.0
Subject: Re: eglibc testing?
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
X-List-Received-Date: Thu, 04 Aug 2011 15:15:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, August 04, 2011 10:24:00 AM Phil Blundell wrote:
> On Thu, 2011-06-30 at 07:29 -0700, Khem Raj wrote:
> > On 06/30/2011 03:32 AM, Phil Blundell wrote:
> > > On Thu, 2011-06-16 at 16:18 -0700, Khem Raj wrote:
> > >> Yes I think I should put together my mechanism somewhere and post
> > >> it
> > >> and dejaGNU setup I use for cross testing
> > > 
> > > Did you get a chance to do this at all?
> > 
> > so far no. Let me collect them and make sure they work
> 
> Just a quick reminder about this :-)
> 

Sorry Phil, I owe it to you :) I have not finished it yet.

> p.
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
-- 
Khem Raj


