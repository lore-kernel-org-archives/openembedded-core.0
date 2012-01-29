Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RrS0y-0003C5-Uv
	for openembedded-core@lists.openembedded.org;
	Sun, 29 Jan 2012 11:29:41 +0100
Received: by lahc1 with SMTP id c1so1651516lah.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jan 2012 02:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=Mj7IUFyDj+omUswuJrf+ZqRUclFejO81ApDU1wB0rBI=;
	b=IwjeZyWGJ3IsMUF7zxDUhPdZHgsdzGL0uW7czFJhv/FIwFpl55g19xgyQYuNE4dD02
	ZKG9WGjG+XE1CHXVGpMevMNUx7l8Rdq1R/le5paN7eDxhwoDaVq0eZvti8s7NJYNjljU
	ZcysmsDPS11y1Os+GW5YYEZ9bRYhPUMmQX+Pk=
Received: by 10.112.99.136 with SMTP id eq8mr3441309lbb.42.1327832508788; Sun,
	29 Jan 2012 02:21:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Sun, 29 Jan 2012 02:21:18 -0800 (PST)
In-Reply-To: <4F24F822.1010102@emagii.com>
References: <4F24F822.1010102@emagii.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Jan 2012 02:21:18 -0800
Message-ID: <CAMKF1spQSH0kS6LKTOBP2wqtsL_NBLRhPNqejqwhQCy=K0cjMg@mail.gmail.com>
To: ulf@emagii.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: module.init-tools-3.16.tar.bz2 no longer available at kernel.org
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
X-List-Received-Date: Sun, 29 Jan 2012 10:29:41 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Jan 28, 2012 at 11:41 PM, Ulf Samuelsson
<openembedded-core@emagii.com> wrote:
> Don't know why, but it is no longer available (used to be).
>
> "openembedded-core/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb"
> is thus broken.
>
> Found it on a mirror.
>
> "http://ftp.tlk-l.net/pub/mirrors/kernel.org/linux/utils/kernel/module-init-tools/"
>
> but it would be nice if it was cached somewhere.

autobuilder.yoctoproject.org should have it

> openembedded-core@lists.openembedded.org
>
> --
> Best Regards
> Ulf Samuelsson
> eMagii
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


