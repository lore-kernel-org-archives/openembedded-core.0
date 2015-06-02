Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id A72467564A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 10:24:01 +0000 (UTC)
Received: by qkhq76 with SMTP id q76so69589698qkh.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jun 2015 03:24:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ZKohZ1UvwNu4MZ0KqWx8mSZhaJ2PLsdVKIyf+xQ09eM=;
	b=PIc5RXZHc7sPmcsAnh7iiRoJPL5mDHDC3laryCo5dzwPCB+4xo0aLTJ2fmiDOrOU0a
	d86qoVkHyMpSDs+R+UiPo6SvGVXBHV/snlBqC3nQKTzSi7IP7KpYQ4BtT8LEiq4xYjQP
	3y2Gbsz2iMc/e2lFipfY8pIT56KE3rbvi7ppEuDnl1GF5ZRM1L6elrDA/JxUxjGNdAkF
	i/6sfIX+NLPDe2NMW9DHgKh8ZuWe++gCyin10akXmrQfCKIDaDLOvxDIquz+IHLrh3yr
	QQtrS8KLnoqLAH8QZj/a78onVYknDXeY/PRazlNfpE4GiUenV3dC6u+Cp1C5u08uXU9t
	f3gg==
X-Gm-Message-State: ALoCoQkyBOimGpcEZiUmF4K4WzmT5FG6Lrgzs6pLNY5DDBSzOwYa35EKfs4L/pygbcIsLdIGuZwO
X-Received: by 10.55.40.18 with SMTP id o18mr46225497qkh.58.1433240643195;
	Tue, 02 Jun 2015 03:24:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 2 Jun 2015 03:23:42 -0700 (PDT)
In-Reply-To: <cover.1433167180.git.akuster808@gmail.com>
References: <cover.1433167180.git.akuster808@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Jun 2015 11:23:42 +0100
Message-ID: <CAJTo0LZHhxEYk2m4_gS_THgssWF9cVHGULprcrUEwoeQjk1C2Q@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Gnutls 3.4.1 update
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
X-List-Received-Date: Tue, 02 Jun 2015 10:24:05 -0000
Content-Type: multipart/alternative; boundary=001a11440fb86a5d8605178657b3

--001a11440fb86a5d8605178657b3
Content-Type: text/plain; charset=UTF-8

Hi Armin,

On 1 June 2015 at 15:12, Armin Kuster <akuster808@gmail.com> wrote:

> core-image-minimal builds but not sato or oe-core world. I am providing
> this so those who want can test their apps with these changes.
>

What's the scale of the breakage when building oe-core world?

Ross

--001a11440fb86a5d8605178657b3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Armin,</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_quote">=
On 1 June 2015 at 15:12, Armin Kuster <span dir=3D"ltr">&lt;<a href=3D"mail=
to:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1h6" class=3D"a3s"=
 style=3D"overflow:hidden">core-image-minimal builds but not sato or oe-cor=
e world. I am providing this so those who want can test their apps with the=
se changes.<br></div></blockquote></div><br>What&#39;s the scale of the bre=
akage when building oe-core world?</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a11440fb86a5d8605178657b3--
