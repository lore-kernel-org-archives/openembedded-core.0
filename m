Return-Path: <ashcharles@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 812C7761D3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 17:12:10 +0000 (UTC)
Received: by igk11 with SMTP id 11so15402407igk.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 10:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=6LC7rAd63PK/6JgTOk6DfnqG67F217SmNIZtn+DckQE=;
	b=IiD66SYkWOKCDbNZdLPkHT4dg/Opop+nvxe28CMC4AIZyaWjiIXkrnaTLXp3GL2AmO
	aMdNNKKB1y3/mWQzzN4/JQ4Sk0dQ54O7ikbYNLLsfsBcP/mAVKOa9TX+9gEMKstL1c44
	ibzZJxPEKqN8DBEgU8wH/vNvNv2OGNRiZkkLvaY4/Q1oFdUSd4h7JEmRJdLIbZsrlgPt
	2h8o2+tq5R9kRRSouDiVraLRC8CUc/yKkeYJQIpUEK64Ra6uTonLKlsrEZAPQ0Bir5mt
	MEV4omt1N6msOEO2PcyD84nXAdCWtHyF8BS4Zs8Gj+/TP0CLA2zgN3eWnExWYJkS7mvf
	pn5g==
X-Received: by 10.50.79.230 with SMTP id m6mr6624712igx.86.1438276330980; Thu,
	30 Jul 2015 10:12:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.166 with HTTP; Thu, 30 Jul 2015 10:11:38 -0700 (PDT)
In-Reply-To: <1438273329.3455.27.camel@collabora.co.uk>
References: <1437687855-6499-1-git-send-email-ashcharles@gmail.com>
	<1438273329.3455.27.camel@collabora.co.uk>
From: Ash Charles <ashcharles@gmail.com>
Date: Thu, 30 Jul 2015 10:11:38 -0700
Message-ID: <CAK8F28mwi2=weNnu9b22_5q-wZ-mKsuwcP8AjiZ9YfWP5WYoCA@mail.gmail.com>
To: Joshua Lock <joshua.lock@collabora.co.uk>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [fido][PATCH 0/2] Backports for WIC
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
X-List-Received-Date: Thu, 30 Jul 2015 17:12:12 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 30, 2015 at 9:22 AM, Joshua Lock
<joshua.lock@collabora.co.uk> wrote:
> Backporting those
> changes seems reasonable to me, I've queued them in my joshuagl/fido
> -next branch[1].
Thanks Joshua.
--Ash

