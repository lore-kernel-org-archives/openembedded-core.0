Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id E97827162E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 18:15:30 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id n4so8794853qaq.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 10:15:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4Bx+ueBunY1Uc7AQVv5+HwMqkfTiDkDdUnrMY9FYS5w=;
	b=HhS4NQl+QhB9ZvYoLqO1bk53VACC9PVBtsNWTmXk61mj8lLzjXXvkrEMLokWNs9dbT
	Tc5JnqMcEi3IULqx1Lpd9W5Il3BQXs4Abeu8jY2ox4nM05to+zvPw/s0rogemNIqMRps
	G/P6T9Lk5NhNPW6nUa21O+vvMLB+EdFjx+XQF5An0nak9T/fEF0ZIj0v07rPZzg6jtib
	eT0xRq4ctTDMZQI1xz4slsrsJnrWrgG0rSanfLMKyysunMmRoEbfTtAYXbUWOasK7Ygo
	N+A7Dq3Ez5Mdad7NvxWYz4LW3Vf/H/KRc7SHCC+fhmvEeSdiyFQCDIGd8sPe6CwgenEe
	EwfA==
X-Gm-Message-State: ALoCoQlFTAM7Vh4kDaGdkl02gbXYUA5JO6XYCZLlyIRUHJgM1P8P0luXWWGYwjdHBWX/sE88GYee
X-Received: by 10.229.249.137 with SMTP id mk9mr51839676qcb.4.1421086530928;
	Mon, 12 Jan 2015 10:15:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Mon, 12 Jan 2015 10:15:10 -0800 (PST)
In-Reply-To: <1421009125-13379-1-git-send-email-flihp@twobit.us>
References: <1421009125-13379-1-git-send-email-flihp@twobit.us>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 12 Jan 2015 18:15:10 +0000
Message-ID: <CAJTo0LaqfgwbwvN5BR3dzxP-LbgfocwZO2GjT1-Y9Qyy8xyg=w@mail.gmail.com>
To: Philip Tricca <flihp@twobit.us>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-2.7-manifest: Add package for contextlib module
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
X-List-Received-Date: Mon, 12 Jan 2015 18:15:40 -0000
Content-Type: multipart/alternative; boundary=001a11334d90df1ad5050c787d30

--001a11334d90df1ad5050c787d30
Content-Type: text/plain; charset=UTF-8

On 11 January 2015 at 20:45, Philip Tricca <flihp@twobit.us> wrote:

> This is required for python code using 'with' statements.
>

This isn't applying to master, can you rebase it?

Cheers,
Ross

--001a11334d90df1ad5050c787d30
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 January 2015 at 20:45, Philip Tricca <span dir=3D"ltr">&lt;<a href=3D=
"mailto:flihp@twobit.us" target=3D"_blank">flihp@twobit.us</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div id=3D":ow" class=3D"a3s" style=
=3D"overflow:hidden">This is required for python code using &#39;with&#39; =
statements.<br></div></blockquote></div><br>This isn&#39;t applying to mast=
er, can you rebase it?</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Cheers,</div><div class=3D"gmail_extra">Ross</div></div>

--001a11334d90df1ad5050c787d30--
