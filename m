Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6752973D27;
	Mon, 26 Oct 2015 22:49:18 +0000 (UTC)
Received: by ioll68 with SMTP id l68so204111319iol.3;
	Mon, 26 Oct 2015 15:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=JVdJ4M9FQqYL7cA/vBdqWml25jp2JXymruhTPQ0405s=;
	b=1Kd79BcKmjx0fRTJdoBAX/gmsN5nfGOjYsNpMpKCHsZxKpb+is5XH/Sxf6N/myRRrf
	/5IyKVqm8n3fHHVfDA0CrTxsc1F8KoklbvvInrH5Y8beOL6cQM/FTXznyZPNJaTcmg1w
	UkZ6ke1tI6cQC5ZjuLINqJDpB+7RPAqvgQ7gMdRtYNNqvW38SPyOKW5cxY0ze9TBbBaL
	leuOx7Imq+FVY0IdAS5Aa8r3RIfkvnqYVROTWnUyT1PA3p4MPXyIryWFMn671tBYs6PI
	wqxm0KF5zEEMUu3TsdMGgVUbatL8OnqGEyp/QylfLr1quRpn5Ps9oRBwfgBS4WeUREot
	HZ1Q==
MIME-Version: 1.0
X-Received: by 10.107.135.95 with SMTP id j92mr33404099iod.148.1445899758768; 
	Mon, 26 Oct 2015 15:49:18 -0700 (PDT)
Received: by 10.36.31.131 with HTTP; Mon, 26 Oct 2015 15:49:18 -0700 (PDT)
In-Reply-To: <20151026204716.GJ2554@jama>
References: <20151026204716.GJ2554@jama>
Date: Mon, 26 Oct 2015 23:49:18 +0100
Message-ID: <CALbNGRQCwyFKti9sgx0MHkxFbwuksupsjsnQ0UmK=dWQ47AZaw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2015-10-26
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
X-List-Received-Date: Mon, 26 Oct 2015 22:49:21 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 26, 2015 at 9:47 PM, Martin Jansa <martin.jansa@gmail.com> wrote:

> === common (2) ===
>     * /meta-openembedded/meta-oe/recipes-graphics/gerbil/gerbil_git.bb, do_compile
>     * /openembedded-core/meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb, do_compile
^ Hope I find time for this one. What DISTRO features were set: x11 and wayland?

Andreas

