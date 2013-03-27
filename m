Received: from mail-vb0-f50.google.com ([209.85.212.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UKsHx-0003rc-8g
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 16:29:24 +0100
Received: by mail-vb0-f50.google.com with SMTP id fa15so655478vbb.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2013 08:12:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=btqpuDN7Chvb/M39x+3vtr00mpmkgEz2pncwGW6Fnao=;
	b=cieZCuJadfCw3omk+eniEV1ghCQPFWdB1VP3nVppPZRjh9w5sid55+1hGlah2tGPIC
	BlGLtFb4rAN+yTlnAj+SYf7tP2rOfn5omzP7OVCYS5dzbQFclyX3EBq2/V8UcVqm8AEM
	scVpSCpJUEKQgf/qko6bXKSbCbXOE04Z1sI8+svOQEjns7GpvWz4dB2ly4cZ3GF9aken
	EDtKmhb2MtnV2TtsFwHVfRmUmiUbuSTFVHTLl+bvNaybrljWylY3bO7fIxFhMdEmNV3Y
	7J3JA2uCWaCyZUIRHUFZMxvTebKa5tV0bWTP5BY2PnT24FBBiNj60ep0l3DiFkM4iCeU
	ce5g==
X-Received: by 10.58.214.231 with SMTP id od7mr23648952vec.44.1364397139367;
	Wed, 27 Mar 2013 08:12:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.134.74 with HTTP; Wed, 27 Mar 2013 08:11:59 -0700 (PDT)
In-Reply-To: <5695994C-BB2C-427C-A551-1EA6D4C2AD9D@dominion.thruhere.net>
References: <1364386111-1734-1-git-send-email-ross.burton@intel.com>
	<5695994C-BB2C-427C-A551-1EA6D4C2AD9D@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Mar 2013 15:11:59 +0000
Message-ID: <CAJTo0LZsYpzRk_cfLctbpaZQQJKtgb7SSXUq3Zrn7je3HXkgQw@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlWW7adbQmWIP2nqX/6C7X10AdOAhIM3kHgnd0vHsk82nIw769/gJc19xw7XnJPK1f/oE82
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: Upgrade to 198
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Mar 2013 15:29:27 -0000
Content-Type: text/plain; charset=UTF-8

On 27 March 2013 15:03, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Since 199 has been released a few days back, how about upgrading to that and drag in http://cgit.freedesktop.org/systemd/systemd/commit/?id=94243ef299425d6c7089a7a05c48c9bb8f6cf3da ?

I'm about to disappear until the middle of next week, so I can do that
next week unless a patch beats me to it.

Ross


