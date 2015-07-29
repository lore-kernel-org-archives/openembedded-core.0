Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 129C876248
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 12:27:08 +0000 (UTC)
Received: by qged69 with SMTP id d69so3223900qge.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 05:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=F2m0jKidNQuDLUcZUYV5DxtirR/WSz4tFI4S9li/PhM=;
	b=Z1A1nW/kKcq0//OnKfp9Dxhq6214HJPvXgydXQhYC7Kn54M0zwGANaARDtjqfLiltY
	tO7aMIBWxxR75py3eeds4YxtsdIsp6kBxeiDlrJtrVA41BBgQaGSf/yvrs/gkWzESSkV
	ZRbIRterDQqibajvB1evZxPSoSp0G2Wye5uFr/bu3Icy6o1wNdseQB+WLO299PEPS6x2
	v7O9JbnvsR6mPBlJP6yz9rPNCfLM+GRfGuHCIKWmk6puUMtShFR9LUxMqPAbRZPR57+Y
	vWNKzT6CKEC/yhN+vnyE7b9LeC5M57cXC+VdoRqkbsDWgWlW/cpp++1tbuttv8pVLWha
	6u2A==
X-Gm-Message-State: ALoCoQlw8u4G5PGGD93lRxIiJ8WYhflEzLu4P8FnS6OV1xuC4hto2Qny1JR+XpTRmXdUvOzZuESe
X-Received: by 10.140.43.100 with SMTP id d91mr61538867qga.77.1438172828880;
	Wed, 29 Jul 2015 05:27:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Wed, 29 Jul 2015 05:26:49 -0700 (PDT)
In-Reply-To: <1438134558-7785-1-git-send-email-li.zhou@windriver.com>
References: <1438134558-7785-1-git-send-email-li.zhou@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 29 Jul 2015 13:26:49 +0100
Message-ID: <CAJTo0LYkVtGiWfH-yf0T7PWREdk=ZyoMU3LyV1OEQpqWCiy2pg@mail.gmail.com>
To: Li Zhou <li.zhou@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tzdata: Add marking for config files in recipe
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
X-List-Received-Date: Wed, 29 Jul 2015 12:27:10 -0000
Content-Type: multipart/alternative; boundary=001a113a989c9789e8051c02b49d

--001a113a989c9789e8051c02b49d
Content-Type: text/plain; charset=UTF-8

On 29 July 2015 at 02:49, Li Zhou <li.zhou@windriver.com> wrote:

>  meta/recipes-extended/tzdata/tzdata.inc |    2 ++
>

This inc file was removed last month, please rebase to master.

Ross

--001a113a989c9789e8051c02b49d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 July 2015 at 02:49, Li Zhou <span dir=3D"ltr">&lt;<a href=3D"mailto:l=
i.zhou@windriver.com" target=3D"_blank">li.zhou@windriver.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":2g1" class=3D"a3s" s=
tyle=3D"overflow:hidden">=C2=A0meta/recipes-extended/tzdata/tzdata.inc |=C2=
=A0 =C2=A0 2 ++<br></div></blockquote></div><br>This inc file was removed l=
ast month, please rebase to master.</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></div>

--001a113a989c9789e8051c02b49d--
