Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3AA6865CDD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 10:32:18 +0000 (UTC)
Received: by qgef3 with SMTP id f3so63246772qge.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jul 2015 03:32:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7Jyj1bq9yJvPUHr8hlmvlVBtkQ3cTkQ3E0wNfC7+85Q=;
	b=AispuJycQmigB0PicWidiucxdbPvGoaDIBqg/LQlZrxhMmQIx/3o/HVKYYI9voWr9P
	iUd5Z39I4pgjuVVwD/BlmjC1nlTNHfZcFt04zwnXSGD7rPUldpHNHL4SjbJaObmSagD4
	/0uU0h7GiLxcdQuoBrtTJObXzJCjEXVKcCIwy9OQOnmP24ZlXKeUwxifLUv+V2wM1uG7
	sLuWF3usV63p6q0D2UuexxwBXiFhcLiVjPdqZQvZ/WSD7go5HNtlvBFrjrsPisXcPLPj
	qnMfpNBLdTgZRWDiI88f/J9aNQwUG2azCM5VTMyAo48vlKeGHON0S7Kgt5wJQhqwG7u4
	8PiA==
X-Gm-Message-State: ALoCoQlAQnClS/ITlhVDFD3X8XSZvbCqqDVLlEVAkd87vXrrsOeZZtY+1mZimEzzZJPcZ0FGlbVw
X-Received: by 10.140.235.19 with SMTP id g19mr24503860qhc.52.1436437938994;
	Thu, 09 Jul 2015 03:32:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 9 Jul 2015 03:31:59 -0700 (PDT)
In-Reply-To: <81B0EC78FE09F04E8E0FF9B9C2BF8A364939B6C3@deeres07.ebgroup.elektrobit.com>
References: <81B0EC78FE09F04E8E0FF9B9C2BF8A364939A836@deeres07.ebgroup.elektrobit.com>
	<CAHiDW_FZoQudwPMdV-zTF-SZ2OVoAjNXuoYY8vUTkSQfoMXDtQ@mail.gmail.com>
	<81B0EC78FE09F04E8E0FF9B9C2BF8A364939A858@deeres07.ebgroup.elektrobit.com>
	<CAJTo0LZaxAkJtQm6cTnLxaEDESRqiQPWbRNwDTjOt+0g3MVZ=Q@mail.gmail.com>
	<81B0EC78FE09F04E8E0FF9B9C2BF8A364939A8DC@deeres07.ebgroup.elektrobit.com>
	<81B0EC78FE09F04E8E0FF9B9C2BF8A364939B6C3@deeres07.ebgroup.elektrobit.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 Jul 2015 11:31:59 +0100
Message-ID: <CAJTo0LbFvNiD5fbLkHF37SPCGJJ-5fGBxGdXKQ5yy5gD=Uh=sw@mail.gmail.com>
To: Steffen.Pankratz@elektrobit.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libdrm: Upgrade to 2.4.62
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
X-List-Received-Date: Thu, 09 Jul 2015 10:32:19 -0000
Content-Type: multipart/alternative; boundary=001a11376dac189609051a6ec5b9

--001a11376dac189609051a6ec5b9
Content-Type: text/plain; charset=UTF-8

Hi Steffen,

On 9 July 2015 at 09:45, <Steffen.Pankratz@elektrobit.com> wrote:

> As your patch is in master now, here is my updated patch:
>

Can you re-send this using git-send-email, something is mangling the patch
and it won't apply.

Ross

--001a11376dac189609051a6ec5b9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Steffen,</div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On 9 July 2015 at 09:45,  <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:Steffen.Pankratz@elektrobit.com" target=
=3D"_blank">Steffen.Pankratz@elektrobit.com</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><div id=3D":65r" class=3D"a3s" style=3D"overflow:h=
idden">As your patch is in master now, here is my updated patch:<br></div><=
/blockquote></div><br>Can you re-send this using git-send-email, something =
is mangling the patch and it won&#39;t apply.</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11376dac189609051a6ec5b9--
