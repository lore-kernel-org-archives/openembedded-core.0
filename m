Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 51AD475794
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Aug 2015 04:37:26 +0000 (UTC)
Received: by igr7 with SMTP id 7so67433697igr.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Aug 2015 21:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=FpY/SWvlT+wZo0F1IT1fmQQQ2r7B1NsmdkoHXEoPZFk=;
	b=W1QH5d4ZeHy76zya33feJv+1BQuOa0qxzBkNluD21LdIvyL5kWH7cKSt//0qI3Qm90
	wNCkARWn76ez3MJBasiUEsckNWQYdbaCSn3n63ft7jHl5iU8m534U7KRP9ycaFMD7qYj
	NQQwfkPYyKX4u02hHbAsuaQ00w+6tuHyyR/Nu+CVtLQDPYsLtbzxCTkDEQnGUMQfxHi3
	/u+BPsnpyWaLxzmrCk2yFFvyO9n31s03zZVizjHGLx3js7n8hz0wvaWAHeYUWzlb2SKs
	AD8dOi13qXYv4vQRFt0UiyRWymGppQB16r8809yEfxm5HLEaWfFmw3s2dHxf5teFxNO0
	KVmA==
X-Received: by 10.50.110.72 with SMTP id hy8mr24227754igb.36.1438663046746;
	Mon, 03 Aug 2015 21:37:26 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.199 with HTTP; Mon, 3 Aug 2015 21:37:07 -0700 (PDT)
In-Reply-To: <1438634128-4347-3-git-send-email-juro.bystricky@intel.com>
References: <1438634128-4347-1-git-send-email-juro.bystricky@intel.com>
	<1438634128-4347-3-git-send-email-juro.bystricky@intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 3 Aug 2015 21:37:07 -0700
X-Google-Sender-Auth: dv73y0OK_avoHxsxpYnrNn3XhnI
Message-ID: <CABcZAN=QzPv4W+wyZCcrx6LPjNKqf7s+JLkLKky1QT5_WF+Ndg@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: richard.purdie@intel.com, jurobystricky@hotmail.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] build-appliance-image: support for VirtualBox guest addtions
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
X-List-Received-Date: Tue, 04 Aug 2015 04:37:30 -0000
Content-Type: multipart/alternative; boundary=089e011849d4da5a43051c74d7d2

--089e011849d4da5a43051c74d7d2
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 3, 2015 at 1:35 PM, Juro Bystricky <juro.bystricky@intel.com>
wrote:

> It is possible to run Build Appliance VM using VirtualBox.
> User experience can be improved by installing VirtulaBox guest
>

Typo: VirtulaBox


-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e011849d4da5a43051c74d7d2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Aug 3, 2015 at 1:35 PM, Juro Bystricky <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:juro.bystricky@intel.com" target=3D"_blank">juro.bystricky@inte=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1=
tg" class=3D"a3s" style=3D"overflow:hidden">It is possible to run Build App=
liance VM using VirtualBox.<br>
User experience can be improved by installing VirtulaBox guest</div></block=
quote></div><br>Typo: VirtulaBox<br><br clear=3D"all"><div><br></div>-- <br=
><div class=3D"gmail_signature">Christopher Larson<br>clarson at kergoth do=
t com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<=
br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--089e011849d4da5a43051c74d7d2--
