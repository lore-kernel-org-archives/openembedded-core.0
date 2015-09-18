Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7D3F876FD0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 10:53:47 +0000 (UTC)
Received: by qkcf65 with SMTP id f65so17662534qkc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 03:53:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=c2WoSX0lUdkGW+j4+MoOvgB2UO/JE3Fv8zYJC/MCu7Y=;
	b=PHjZSNnNUcVFig87OAnzljGSNb7XjcoE0m2Rpvqbt8VgcxkMvI9UI0M+ye2aEiIQGg
	fzN8ucn2xisnixNePMve9oaC5UzHgFqEi+pOwD2oWwt4cIJAs8HvxWciB+vZebSBWyur
	RK5yQrz4at2ilF1mF2LvAt5oWn4X7M1pZqsuJkMOj1KdOL/1XYCJSxr1lr+lmmzrbgFS
	7geJIoywSBYyryLaxmcy8kJiE3B7Rjdulr2I5CL5xCYLxWpEHTZdKAI27y91QSsRbBLP
	ZiTtAePbhMzV+/ORzKjYOspLODvvYqyq6iWpblFAmQvfkXMmgmOs6Hbc5Fvb83bZVRX5
	I3PA==
X-Gm-Message-State: ALoCoQly1yDFqb1RE1yswKyHSx1aLyzkqLs3X/BN6+DCLmQHizNU/Pip7fi0Qo0eQj8IE1xn+m6e
X-Received: by 10.55.20.154 with SMTP id 26mr5561936qku.104.1442573627771;
	Fri, 18 Sep 2015 03:53:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Fri, 18 Sep 2015 03:53:28 -0700 (PDT)
In-Reply-To: <49a75fb1c8a88fbaf77f9b19b054802cc21559d6.1442546459.git.kai.kang@windriver.com>
References: <cover.1442546459.git.kai.kang@windriver.com>
	<49a75fb1c8a88fbaf77f9b19b054802cc21559d6.1442546459.git.kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 18 Sep 2015 11:53:28 +0100
Message-ID: <CAJTo0LayLRNJPRe69m8D12qBC0j8+j-DiHAwjZRY_V06T9to+Q@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] bind: 9.10.2-P4 -> 9.10.3
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
X-List-Received-Date: Fri, 18 Sep 2015 10:53:49 -0000
Content-Type: multipart/alternative; boundary=001a1145e79ca5818b05200358da

--001a1145e79ca5818b05200358da
Content-Type: text/plain; charset=UTF-8

On 18 September 2015 at 04:22, <kai.kang@windriver.com> wrote:

> Upgrade bind to 9.10.3 to fix CVE issues.
>

Sorry, but we just had the M3 build so can you submit this as a patch to
9.10.2-P4 instead of an upgrade?

Ross

--001a1145e79ca5818b05200358da
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 September 2015 at 04:22,  <span dir=3D"ltr">&lt;<a href=3D"mailto:kai=
.kang@windriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div style=3D"overflow:hidden">U=
pgrade bind to 9.10.3 to fix CVE issues.<br></div></blockquote></div><br>So=
rry, but we just had the M3 build so can you submit this as a patch to 9.10=
.2-P4 instead of an upgrade?</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">Ross</div></div>

--001a1145e79ca5818b05200358da--
