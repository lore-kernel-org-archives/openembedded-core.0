Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id D2071601F5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 17:28:36 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id m20so13254791qcx.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Dec 2014 09:28:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=tXG+lUF5MwRbi8ms32/T3/KFlsMn+GMOinN5xxEdBmQ=;
	b=XCBcPKEDxygbjTvnVEyjRdNjURhUBArY/tEO80l7VQCoLG4VOOYoG9RynVy8KM+VJ1
	BwqifaEZdUU7/BZGLp2O2BUHlKk7kQnPjlHN19OjuSTjDwNmcYc2NA9PSisKKlD1ytcf
	+PXP8IOBm4F5CCLQaUKln9WkNjeQAKJVGM9ZCRHoJSHrYGxMF0EwcYlmxVZw25dv+P/Q
	G8+56SchiU4b9pFHUM0GrGahDm8FVnOb2tb5fNqv4ybQkgdQEa1+Mgs5iIdZKvhQUFAE
	dV5B/g/xG0yGkD0B2O78wEEGLwWwEXU4J2TTgf4fSnQAq/yofVyyMqqP6OgeumeL2SnJ
	SMrA==
X-Gm-Message-State: ALoCoQmU+sL+nMYnkFSRNAFSvx3BXTBMINfiWJxK1cO4DiPCGO/H6BUXXUQUvBBG2X1FOAnak6N6
X-Received: by 10.224.3.137 with SMTP id 9mr18914391qan.64.1417714116633; Thu,
	04 Dec 2014 09:28:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Thu, 4 Dec 2014 09:28:16 -0800 (PST)
In-Reply-To: <547FC6F9.3050609@windriver.com>
References: <547FC6F9.3050609@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Dec 2014 17:28:16 +0000
Message-ID: <CAJTo0LY-Ne=J0NAUFO5E+mp6rVj=Zptq7aXnqPeJJ9x-2Ef3Ng@mail.gmail.com>
To: "Shiqun.Lin" <Shiqun.Lin@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] improve the sanity check for PATH and BBPATH
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
X-List-Received-Date: Thu, 04 Dec 2014 17:28:38 -0000
Content-Type: multipart/alternative; boundary=001a11c2480a50bb110509674a25

--001a11c2480a50bb110509674a25
Content-Type: text/plain; charset=UTF-8

This doesn't apply to master, can you rebase?

Ross

On 4 December 2014 at 02:29, Shiqun.Lin <Shiqun.Lin@windriver.com> wrote:

>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a11c2480a50bb110509674a25
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This doesn&#39;t apply to master, can you rebase?<div><br>=
</div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On 4 December 2014 at 02:29, Shiqun.Lin <span dir=3D"ltr">&lt;<a =
href=3D"mailto:Shiqun.Lin@windriver.com" target=3D"_blank">Shiqun.Lin@windr=
iver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
<br></blockquote></div><br></div>

--001a11c2480a50bb110509674a25--
