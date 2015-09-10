Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id E734673243
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 19:40:47 +0000 (UTC)
Received: by qgev79 with SMTP id v79so44837770qge.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 12:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=bG5e9m9uW9WRXmaO5yZ+qLXPO0eRSz2m+QknjYaszjc=;
	b=ayBtMjTw+p3YMQp5PE99P8YZWhPiIteR7yBBcmgSWYuHNlw1YbjQT2/knUuE10cQQ+
	nlvEmqROrIbP1iaxWtzij8iL4dGddBw0CQvKtvJmY6gYALWKNFI66hcqNfChYBe6Oaxz
	KCsgASvupf56lQ1XkM3VzdWbVoao37PAEkNNmVhRv+DWnTT2gv1vcokd8YKiXqm9U+qG
	vQuVjHdEXZ/zkhsSIlDvuhdpbraRtPoaNKvFMmgk21riWNB6dOH+Ujrb3BpmOnVGLay3
	IyTZeQQP7RqKRuOeDGgQ7ZVMwA/DP+VAXvfA1vu6CN26LIvOnZloWmZTNl9JfM3JU+8x
	uIMA==
X-Gm-Message-State: ALoCoQmooYGAbVjBxDc05VkyzmzuGGmKknnXZZlPRuRPf4m8c0ABM4YqJ4ZSXg3+XhIcqapdHD1O
X-Received: by 10.140.89.10 with SMTP id u10mr56244441qgd.15.1441914047850;
	Thu, 10 Sep 2015 12:40:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Thu, 10 Sep 2015 12:40:28 -0700 (PDT)
In-Reply-To: <1441909087-3860-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1441909087-3860-1-git-send-email-alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 Sep 2015 20:40:28 +0100
Message-ID: <CAJTo0LYCw9pFKn+jkT_a-O8h4r48CCjK2DZDe5oJUsuSuKvGQA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk: add a new recipe for latest upstream version
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
X-List-Received-Date: Thu, 10 Sep 2015 19:40:48 -0000
Content-Type: multipart/alternative; boundary=001a11c1211a9e945a051f69c6a4

--001a11c1211a9e945a051f69c6a4
Content-Type: text/plain; charset=UTF-8

On 10 September 2015 at 19:18, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> +Upstream-status: Backport [should appear in 2.10,
> http://trac.webkit.org/changeset/184856]
>

Capital S in Status, and missing a signed-off-by (your name in the patch
header doesn't count).  I've made these changes locally, don't bother
sending a revised edition.

Ross

--001a11c1211a9e945a051f69c6a4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 September 2015 at 19:18, Alexander Kanavin <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexande=
r.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><div id=3D":24d" class=3D"a3s" style=3D"overflow:hidden">+Upstream-s=
tatus: Backport [should appear in 2.10, <a href=3D"http://trac.webkit.org/c=
hangeset/184856" rel=3D"noreferrer" target=3D"_blank">http://trac.webkit.or=
g/changeset/184856</a>]<br></div></blockquote></div><br>Capital S in Status=
, and missing a signed-off-by (your name in the patch header doesn&#39;t co=
unt).=C2=A0 I&#39;ve made these changes locally, don&#39;t bother sending a=
 revised edition.</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">Ross</div></div>

--001a11c1211a9e945a051f69c6a4--
