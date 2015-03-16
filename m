Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id DD4E16013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 11:43:56 +0000 (UTC)
Received: by qcto4 with SMTP id o4so40419426qct.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 04:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ARc1yrkmpfhLskGyhNyxcNh3hRNq7WBHtIw6QTN5LI4=;
	b=FvmAfG4vdNtBE3r8qsy6y2rnvnUOE5n6JpcAzwb80qQy3m1V2YFO6D0ngGoxPNNYcy
	niVqNvCVrRwOqjCaZx6ZyT54E3CHL+n2VQZOa6zmCIfLdBg6uOXKuCgBHSzdSUyUeiUv
	jAt45599r+K1a6BuBcNJFxrsRWUtmF+AIPJ8trkZNw2ioXAvMXgE0X2pGyv9tymqMl44
	drEDgNaIazGiI4XoujTyqSGES3AeaEw54gOKXirBG4Cnd8cT6/j84+FyejjDoY6nw5MP
	TXd28IoC+aV8xUYTkxVKdryVmuV+uRx1Bvf5AhNUwlFOE7u9mQ9w7sfglxCgvufmZwwm
	0XuQ==
X-Gm-Message-State: ALoCoQmR9g1PNlQ0pmEEHEhH2elLsbaEsh+6cVD3BbyX3cHGncP+YHl3iyaCCwfFA6JFP+p+MnTl
X-Received: by 10.140.232.3 with SMTP id d3mr78066102qhc.82.1426506237620;
	Mon, 16 Mar 2015 04:43:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Mon, 16 Mar 2015 04:43:37 -0700 (PDT)
In-Reply-To: <1426271998-12451-1-git-send-email-Martin.Jansa@gmail.com>
References: <1426271998-12451-1-git-send-email-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Mar 2015 13:43:37 +0200
Message-ID: <CAJTo0LaKV5iUOzOPU-nnm1Yqd0C84aT+B3iMHo7OB8osQpj-ew@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] valgrind: enable building on 4.x kernel
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
X-List-Received-Date: Mon, 16 Mar 2015 11:44:00 -0000
Content-Type: multipart/alternative; boundary=001a11c128b09057910511665d52

--001a11c128b09057910511665d52
Content-Type: text/plain; charset=UTF-8

On 13 March 2015 at 20:39, Martin Jansa <martin.jansa@gmail.com> wrote:

> +Upstream-Status: Pending
>

Missing S-o-b in the patch.

Ross

--001a11c128b09057910511665d52
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 March 2015 at 20:39, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":257" class=
=3D"a3s" style=3D"overflow:hidden">+Upstream-Status: Pending<br></div></blo=
ckquote></div><br>Missing S-o-b in the patch.</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c128b09057910511665d52--
