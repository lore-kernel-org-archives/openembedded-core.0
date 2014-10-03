Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 20A1F70F3B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Oct 2014 16:47:17 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id h15so674759igd.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Oct 2014 09:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=3ysxqlYnq1Ng4j6cqzP+dwYSgPqEeQHUUIW+nqPATH0=;
	b=NsG18gNaJitnEZ/HJQl22Nf5GKpDMqbX1QSjmTQNpltUJWjqGKrWdRG0CsMl9ZrB1f
	GjiIcvkqwHckQYBz3Gb34zlWm8Z0OyZE1j1HKexzJSu1BW+QDXP1xGd6GPm0Tk5ztiuc
	KIpLOrP78Ai2t8IAdNtnUDxU180SQLcnsOEdYmrKkF+YTSwLRTcZYSUxpomkvq4qU+dM
	Y9ppnWmGsAy6Zwi1MyZ66/2cTQa2PBvBiUivyMSH2nwpvtROMnF5ee+ryge7QUXDpZu3
	1pgbV2Do0uE7M9DvuYqlnxQbBmNXGDZzxqqKV1oRir47hzOzhN/k5jFoTqrP5VzR9v73
	9DMg==
X-Received: by 10.42.62.6 with SMTP id w6mr14004051ich.24.1412354838193; Fri,
	03 Oct 2014 09:47:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.179.5 with HTTP; Fri, 3 Oct 2014 09:46:48 -0700 (PDT)
In-Reply-To: <CC366DA2-152C-4E5C-9F9C-2BB6C1ED73B7@dominion.thruhere.net>
References: <1411647477-12992-1-git-send-email-sledz@dresearch-fe.de>
	<20141001005520.GO2480@denix.org>
	<CAMKF1sqJ=QsZWNWe436Q6hNaegEm6HMj76JtXU-gZBhrkRutAQ@mail.gmail.com>
	<20141001013231.GQ2480@denix.org>
	<CAMKF1sqa2JtVOhv7f0P=_HfSnrL2kfd2QmP+GM_FsM3zb-xq=g@mail.gmail.com>
	<20141001041020.GC25706@jama> <1412151136.17658.10.camel@ted>
	<20141001153415.GF25706@jama>
	<CC366DA2-152C-4E5C-9F9C-2BB6C1ED73B7@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Oct 2014 09:46:48 -0700
Message-ID: <CAMKF1so0ewHS3fdZC_2Y_qee=+t6O5=-zF6yhqe9A_0pVWFBsQ@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [daisy][PATCH 1/3] layer.conf: Add in useradd dependencies as ABISAFE dependencies
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
X-List-Received-Date: Fri, 03 Oct 2014 16:47:18 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 3, 2014 at 1:24 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> That 'new screen' is indeed an improvement and I also found the switch to make it show a unidiff instead of side-by-side. I still despise the UI, though, but not as much as before :)

all tools suck, some suck less some suck more.

