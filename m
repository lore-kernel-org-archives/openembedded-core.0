Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5FB9C73237
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 11:28:28 +0000 (UTC)
Received: by qges31 with SMTP id s31so25243767qge.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 04:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=nkXWN6Xjgq7V99faSy4o+NFKaZAud/wLRz8ol+z1mOQ=;
	b=dHiJN5saNequKoR5eEmMn7RTxAfJEWHemPzyLqCYSTCCJj5bENoXVKEsH1RKGKqr+h
	AhW0XIO+268mo8vxSrV2x48tsxgxIfWrmxImDIFukMh2ShlM74BdnA0hLQ6nPtUT10B9
	iEylwx1ta7GbANYatx0c5TtR1FLa1LmwsuVjZX7QvJXGU3rpzZdrQZ7fViL2kCyMq/0A
	xom3EPUMH9sTt2NKF2w6wnoxzhPnCE3744O+57i+Wt21OZV0pjMmEmO0Yda9vMeOJLep
	hRHZOBZCuyPJ6K1vg6ofjSG1uwBlli3HOfHKGMhMG2g1qbC6n+4Uq3/NcksV1LxPQ0Cj
	8iVw==
X-Gm-Message-State: ALoCoQlA7IxIBGN3T4mRpLnbztfxihLUHtYf+RBdWLK9QoxnuFTmDzXrstzllkChwEROpc1+Hf2j
X-Received: by 10.140.234.147 with SMTP id f141mr155414qhc.22.1438082908634;
	Tue, 28 Jul 2015 04:28:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Tue, 28 Jul 2015 04:28:09 -0700 (PDT)
In-Reply-To: <1438062038-10291-1-git-send-email-jianchuan.wang@windriver.com>
References: <1438062038-10291-1-git-send-email-jianchuan.wang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 28 Jul 2015 12:28:09 +0100
Message-ID: <CAJTo0LYEwcGmTUkuz3fWN3F5bn3PBLFLAkuzVPHU4ALknDJ+wA@mail.gmail.com>
To: jianchuan.wang@windriver.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libhugetlbfs: Uprev to v2.19 from v2.18
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
X-List-Received-Date: Tue, 28 Jul 2015 11:28:28 -0000
Content-Type: multipart/alternative; boundary=001a11c0f5faed74b4051bedc499

--001a11c0f5faed74b4051bedc499
Content-Type: text/plain; charset=UTF-8

On 28 July 2015 at 06:40, <jianchuan.wang@windriver.com> wrote:

> From: Jianchuan Wang <jianchuan.wang@windriver.com>
>
> The 5 patches which are deleted have been in the v2.19
>

Wrong list for this and xfsprogs - you mean openembedded-devel@ for meta-oe.

Ross

--001a11c0f5faed74b4051bedc499
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 July 2015 at 06:40,  <span dir=3D"ltr">&lt;<a href=3D"mailto:jianchua=
n.wang@windriver.com" target=3D"_blank">jianchuan.wang@windriver.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":21p" class=3D=
"a3s" style=3D"overflow:hidden">From: Jianchuan Wang &lt;<a href=3D"mailto:=
jianchuan.wang@windriver.com">jianchuan.wang@windriver.com</a>&gt;<br>
<br>
The 5 patches which are deleted have been in the v2.19</div></blockquote></=
div><br>Wrong list for this and xfsprogs - you mean openembedded-devel@ for=
 meta-oe.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">Ross</div></div>

--001a11c0f5faed74b4051bedc499--
