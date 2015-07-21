Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 43D65734B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jul 2015 11:05:41 +0000 (UTC)
Received: by qged69 with SMTP id d69so56289763qge.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jul 2015 04:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=UWj56Ss2DH7uCZGQkZB7TRvX3UmKT1A0MlwENmcMIgU=;
	b=ElyhmqBaPxQjWwbXVe8yZyhGU818roIuagqw4VMYCu5YuQwugJbx9GGyQgM8/bG+YE
	1X22+cYA5PtwqzixqusQFV7mQFO8PytDlarghktEEMqM6ZIgV1gyVjvgwKhJPB/J10js
	0yGQ4afq35klVjRQHCXA6YBoPmWN9yUQYwrVWewW7PbKDUCsgtujEJkr4jJIariAVBe1
	9GwvfhY9DMXjSB5XQXEIJqgDUh0U4RnybmU5tYfeUyxmi3IJeuURN4YJ6ZFbItc/mIGo
	1Fhvmz5MRNk13Bor+KZW7c4TxmJQT0ETBThqFJXgGMWcyF5lOVIyeqJlh4yLV4JIqvTH
	yRLg==
X-Gm-Message-State: ALoCoQni1L5TccSYQKcqNUhhwZ1ycBJ5pGM3lEX+A7ow30AO7Z6hn78TOndj5Hokx0qlmNnWtWgP
X-Received: by 10.55.53.193 with SMTP id c184mr51276702qka.62.1437476741526;
	Tue, 21 Jul 2015 04:05:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Tue, 21 Jul 2015 04:05:22 -0700 (PDT)
In-Reply-To: <35900b5a9fe27b838b4a43cd89c44ca28a498092.1437100265.git.liezhi.yang@windriver.com>
References: <cover.1437100265.git.liezhi.yang@windriver.com>
	<35900b5a9fe27b838b4a43cd89c44ca28a498092.1437100265.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 21 Jul 2015 12:05:22 +0100
Message-ID: <CAJTo0LayRxLaPx10x8u_cz2Qx1x5=mTz7ECJrYmNc8fLPZFDUw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] file: 5.23 -> 5.24
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
X-List-Received-Date: Tue, 21 Jul 2015 11:05:44 -0000
Content-Type: multipart/alternative; boundary=001a11476f148d4eca051b60a261

--001a11476f148d4eca051b60a261
Content-Type: text/plain; charset=UTF-8

On 17 July 2015 at 03:31, Robert Yang <liezhi.yang@windriver.com> wrote:

> * Use git repo rather than tarball, rename file_5.23.bb -> file_git.bb
>

Why?

Ross

--001a11476f148d4eca051b60a261
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 July 2015 at 03:31, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mail=
to:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1d9" cla=
ss=3D"a3s" style=3D"overflow:hidden">* Use git repo rather than tarball, re=
name <a href=3D"http://file_5.23.bb" rel=3D"noreferrer" target=3D"_blank">f=
ile_5.23.bb</a> -&gt; <a href=3D"http://file_git.bb" rel=3D"noreferrer" tar=
get=3D"_blank">file_git.bb</a><br></div></blockquote></div><br>Why?</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></d=
iv>

--001a11476f148d4eca051b60a261--
