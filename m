Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8833E6D6DD;
	Fri,  8 Nov 2013 11:58:45 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id x13so437620ief.35
	for <multiple recipients>; Fri, 08 Nov 2013 03:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Q2d1TyGEzyDvOtB2Fmt1NedfCGJQtvsgOp3DAJampN8=;
	b=jKbWLeKQgYKYRPIUwZGDakQWegbkzlFPFWbBKk6ie2r61EXHZ6OVCjeMc22NebhjFO
	8HiuMxPQ+UMQJPtsioOe99lUOD3vmsAijsKqIlf0N7dOtfpNVvfTtnjAbSjNACdgxVtJ
	MXZDZ6aDO+i3OeFuY8JQPmc2733/44KPXC2hspZRL+Uc/V2HGxyj7l+rxtSd3J+B7Jw1
	oVCyAO3fcIyx6VMGHGs4yALRFyIn6S8rKDJgvMGbFkfwAtFxN98zuq9BtUiON3y0h2um
	4oEPQwrPmjFFEvTaBzRkQ97youHL81AuCaHfQQE3SFTWqRKtOlB34fNtsl3U1wL0nENk
	m1fw==
MIME-Version: 1.0
X-Received: by 10.50.153.50 with SMTP id vd18mr2055509igb.6.1383911927270;
	Fri, 08 Nov 2013 03:58:47 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.64.20.229 with HTTP; Fri, 8 Nov 2013 03:58:47 -0800 (PST)
In-Reply-To: <CA+chaQfB37mDfsiFreA3_7NBbeEitnk-xO07i0FKc55hPSZocg@mail.gmail.com>
References: <1383866326.6271.286.camel@ted>
	<CAJTo0LYq5PmQtBdwghmDGLs2ccTO6BBwJNGw7s37Yt+zjkWU6Q@mail.gmail.com>
	<CAAQYJAuMoE6gOMmM2trSN1MY7weCF+07JAJuhQu1K=p5KxO=Yg@mail.gmail.com>
	<1383904061.6271.297.camel@ted>
	<CA+chaQfB37mDfsiFreA3_7NBbeEitnk-xO07i0FKc55hPSZocg@mail.gmail.com>
Date: Fri, 8 Nov 2013 09:58:47 -0200
X-Google-Sender-Auth: GLzOym28Vv7WSNqeu602jI6v8-E
Message-ID: <CAP9ODKraLERNhgOzFCT579goo9-jwQauLeZkZdgT12XxcpE1nw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: Default DISTRO to nodistro
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
X-List-Received-Date: Fri, 08 Nov 2013 11:58:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 8, 2013 at 9:23 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> I don't feel strongly about this, but I have heard people say "distroless"
> and I'm using the same when refering to default oe-core setup.

I like this idea.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

