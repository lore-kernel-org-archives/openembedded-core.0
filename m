Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id BF9D360125
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 10:35:28 +0000 (UTC)
Received: by qkfq186 with SMTP id q186so42546310qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 03:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=mziiuPuN/o07/NvMKyAvMPaz5IxiY7t/ODTOzIpMZBw=;
	b=iRtDjS/+29sUVfaDeNTIK1fH+iQyil3WIKFyJc6rntW2AtPBiyeBjYLirFcYOlYS7M
	lBfMYwJVx70rjTVTAKV09CKk5F9LXo/qZGqt1f9+RR+XwKeahHfVjqEU0WbPScTdaxaN
	NHTF5bQ+jq89yj8AC+WnUxAEVT+z7DmtT8/ePIEucOPU6hjZcBoq5NzKVXsAjYTQvabv
	zdnX6T9l/yt6xXibxn3VMU2xFqAA0LK+nbJz6CJ7dS8JL5xbNNgoSMjUXqUBXrIfzdUa
	WUaRlexVayWstPpy0jbR6KRH1AECMuju0YrxxwfdHdHPfa7kua7EHHa51zHsl47bS8c9
	QIfw==
X-Gm-Message-State: ALoCoQl7RJu6q6QVPbvHxIIurYB38ongLx/b3UOCfqLk31tGbUYE2xKe+X/CnYl6FohDKuYvZ0P4
X-Received: by 10.55.195.86 with SMTP id a83mr21078488qkj.72.1442831728128;
	Mon, 21 Sep 2015 03:35:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Mon, 21 Sep 2015 03:35:08 -0700 (PDT)
In-Reply-To: <1442702597-5619-6-git-send-email-marex@denx.de>
References: <1442702597-5619-1-git-send-email-marex@denx.de>
	<1442702597-5619-6-git-send-email-marex@denx.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 21 Sep 2015 11:35:08 +0100
Message-ID: <CAJTo0LZhfftBwPohVS7FkxerUu5TvfeXEXJAU5i6Ry8i=DUyYQ@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: lftan@altera.com, waltergoossens@home.nl,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/8] openssl: Add nios2 configuration
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
X-List-Received-Date: Mon, 21 Sep 2015 10:35:29 -0000
Content-Type: multipart/alternative; boundary=001a1142b950a04acb05203f7057

--001a1142b950a04acb05203f7057
Content-Type: text/plain; charset=UTF-8

On 19 September 2015 at 23:43, Marek Vasut <marex@denx.de> wrote:

> +Upstream-Status: Inappropriate [configuration]
>

Surely you do want this patch upstream so you don't need to always patch
openssl?  In which case Pending for "I haven't submitted yet" or Submitted
if you have sent it upstream.

Ross

--001a1142b950a04acb05203f7057
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 September 2015 at 23:43, Marek Vasut <span dir=3D"ltr">&lt;<a href=3D=
"mailto:marex@denx.de" target=3D"_blank">marex@denx.de</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><div id=3D":430" class=3D"a3s" style=3D=
"overflow:hidden">+Upstream-Status: Inappropriate [configuration]<br></div>=
</blockquote></div><br>Surely you do want this patch upstream so you don&#3=
9;t need to always patch openssl?=C2=A0 In which case Pending for &quot;I h=
aven&#39;t submitted yet&quot; or Submitted if you have sent it upstream.</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</d=
iv></div>

--001a1142b950a04acb05203f7057--
