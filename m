Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f50.google.com (mail-qa0-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id ACAA86EA47
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Feb 2014 13:14:28 +0000 (UTC)
Received: by mail-qa0-f50.google.com with SMTP id cm18so8806558qab.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Feb 2014 05:14:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=LtOSoHRAUtRrgp65oGBnc5GcNNOCACrdGVaJYKKOs+4=;
	b=WhOWuAe1ZC6xvFi6js1LDZj3612X0fPgC6WquPugwVpuYtBJgeqU6ovUOAP8FDpiQl
	4QkfjjQSXnM+qMchfowhcgPeMvoGBOAgSWpThvlTdtM4MQL24BIpC7UIF6U0WIhROU3l
	sACGMpoIjXvPdiuCOM3vDkhjyV3B20k86L05oQaILJJqn/qrfBAQD5nuUoCbyUR32sw0
	agM3I/4p64/klI1YQ2b2LzkNg8bEftr3W6oP/vzP8w1Rb4h8jFnuC3xY4l2n3+UcZKlQ
	WU2DGF1twqTQbWOYrdX1RNDqwfIy/lDFeOEm9prnoN/ckBImAfukAmyNL6AaUM7or/Sc
	Z1Lg==
X-Gm-Message-State: ALoCoQk1o1NqLfIjWWZR8XWcq5T0g6ytIPFlrai+aMXaf4pCFCwDOXjtSiyFkEfJ59Wh0ifGvcEH
MIME-Version: 1.0
X-Received: by 10.224.97.67 with SMTP id k3mr48221383qan.17.1391346869282;
	Sun, 02 Feb 2014 05:14:29 -0800 (PST)
Received: by 10.140.48.79 with HTTP; Sun, 2 Feb 2014 05:14:29 -0800 (PST)
In-Reply-To: <1391341610.28575.150.camel@ted>
References: <1391082719-14432-1-git-send-email-ross.burton@intel.com>
	<1391082719-14432-2-git-send-email-ross.burton@intel.com>
	<1391341610.28575.150.camel@ted>
Date: Sun, 2 Feb 2014 13:14:29 +0000
Message-ID: <CAJTo0LZ_HvQPJP1oB5QdQTWHk2TxitVS54QQfZaa=R8NAcR=WQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] gnome-desktop-testing: upgrade to current git master
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
X-List-Received-Date: Sun, 02 Feb 2014 13:14:28 -0000
Content-Type: multipart/alternative; boundary=001a11c3f2b4e73c1304f16c2f43

--001a11c3f2b4e73c1304f16c2f43
Content-Type: text/plain; charset=UTF-8

On Sunday, 2 February 2014, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Its rather sad to need the gitsm fetcher. That fetcher isn't mirror safe
> so I'm not sure we can use it.


I've been meaning to ask Colin about tar all releases, so I'll do that now.

Ross

--001a11c3f2b4e73c1304f16c2f43
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sunday, 2 February 2014, Richard Purdie &lt;<a href=3D"mailto:richard.pu=
rdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
Its rather sad to need the gitsm fetcher. That fetcher isn&#39;t mirror saf=
e<br>
so I&#39;m not sure we can use it.</blockquote><div><br></div><div>I&#39;ve=
 been meaning to ask Colin about tar all=C2=A0releases, so I&#39;ll do that=
 now.</div><div><br></div><div>Ross<span></span></div>

--001a11c3f2b4e73c1304f16c2f43--
