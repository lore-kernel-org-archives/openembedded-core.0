Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4356A76618
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 19:29:07 +0000 (UTC)
Received: by iodt126 with SMTP id t126so63176513iod.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 12:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=3bIvu6rZ7d+MAVlLw8mMWNKvcKAgsHk8pZDehs5doiU=;
	b=GYCaa3HiMNAgz3WVoo+rYxNpaD58W75l+mJoeC3Jmb0C0EiQmZ0ZpvSkRg3zx+wnTR
	gV4uj1pOI+zkY/Azfddu3Uf9KxHTGkrNHTfkVUmI10xmQGKDFxzggBLALPS13Fcphp15
	GWCR2bP7Haz+cDDgGN2bc2lQicI0NBDUNkiHdP2gyD/eR1pAdWLCGCS5j3L+jHj3SBb7
	iLqEbCjK6yCO2Y0leHckjAwGwKk29oHbryBOMwoMu2DWgE+Drty+9pRyl0PzvGw1B2dh
	gY+bUBH32ifvt/jDr/hGj81bk5dIlf/J+ysZ+LS0gmYkFnzHc/yEaSnNo4vhsvtwlu8E
	AOzw==
X-Received: by 10.107.168.214 with SMTP id e83mr6085945ioj.112.1439494147824; 
	Thu, 13 Aug 2015 12:29:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Thu, 13 Aug 2015 12:28:38 -0700 (PDT)
In-Reply-To: <55CCE489.504@gmail.com>
References: <1439098101-9400-1-git-send-email-akuster808@gmail.com>
	<CAHiDW_Fzm5wcJHEq54sSLOi564XUgsOrXY0sOxi_Ta5xe8kEpQ@mail.gmail.com>
	<55CCE489.504@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Aug 2015 12:28:38 -0700
Message-ID: <CAMKF1souZ_jFF52dC2OeMQAkN3MnT9XbJ07bwFbrzCqNFT_EGQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nettle: clean up license information
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
X-List-Received-Date: Thu, 13 Aug 2015 19:29:08 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 13, 2015 at 11:40 AM, akuster808 <akuster808@gmail.com> wrote:
>
> For me LGPLv2+ makes is all version above GPL2, but since I am not a lawyer
> it makes not sense on how to play that game. So I decided to drop pressuring
> the update.

We should represent what the license text says

" This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version."

then you say GPL-2.0+

