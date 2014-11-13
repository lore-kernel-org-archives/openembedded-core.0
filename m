Return-Path: <andrei@gherzan.ro>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7C19465C91
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 00:18:50 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id a1so15358532wgh.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 16:18:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=ix7Dm0LHVg2s3O3o5L1bmGjutl3wvgq0BTZPUa4dEgA=;
	b=DRJxu4gbA8UtHy0eHuwPfBzsQvOXNraECrJnqLJ03i2MxDbao/iy9ul2cf9HCw03Ic
	wMqTb3UgbZv0kQIsxNp8a7MroS6IlSxNz8avkPn/atTfcZIKysv8T2kKidAvHI17MH3k
	/hXjcubDocyAMO4fCFh5a5Km8SdEudgWtNTODDXMZpU//pZVcXRJESqMAcpsE8sCkfqH
	ax9MEikRMU+dkKJDfNEjjkG9b/jqNQZGr9rhx/jKq71x5NcrVcQ4cszqIbCZsz3sYViR
	hGxCkOswu//mp1y7KP8wyV3p3KFigZdt55IKFsSc2soYsgi055eNUkiB9641u9r5Bivy
	ETGA==
X-Gm-Message-State: ALoCoQlyS+eloWEue2UhSlUu+quTffSTAA944I+KrOPm3SwMdZzjwT8hVurgSJiAGwOFiLNJTk7u
MIME-Version: 1.0
X-Received: by 10.194.235.135 with SMTP id um7mr26347643wjc.1.1415837930652;
	Wed, 12 Nov 2014 16:18:50 -0800 (PST)
Received: by 10.216.75.70 with HTTP; Wed, 12 Nov 2014 16:18:50 -0800 (PST)
X-Originating-IP: [94.144.63.229]
Received: by 10.216.75.70 with HTTP; Wed, 12 Nov 2014 16:18:50 -0800 (PST)
In-Reply-To: <CAJTo0LZb4fRLx1O2Cc+-9CpP2A03fiBWZX4oY6ryLH9rLfQF6A@mail.gmail.com>
References: <1415377424-2639-1-git-send-email-andrei.gherzan@windriver.com>
	<CAK18fxE0CzhZjcNM7Jf=yEZW6a9YE5J=4H-rJBV7-RACyJjokA@mail.gmail.com>
	<CAJTo0LZpqUUOG6vum-t6nWbkte_WqNDBj+vi7kyXeNVZbX4FXQ@mail.gmail.com>
	<54638918.2040500@gmail.com>
	<CAJTo0LZb4fRLx1O2Cc+-9CpP2A03fiBWZX4oY6ryLH9rLfQF6A@mail.gmail.com>
Date: Thu, 13 Nov 2014 01:18:50 +0100
Message-ID: <CAK18fxFo3MUVqh4bEUObuoEtSjm7Db6kHptg3DJpY1-j=4m2Xw@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
To: Ross Burton <ross.burton@intel.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [master][dizzy][PATCH] xkeyboard-config: Inherit gettext
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
X-List-Received-Date: Thu, 13 Nov 2014 00:18:58 -0000
Content-Type: multipart/alternative; boundary=089e01419f9aeaa0e90507b27497

--089e01419f9aeaa0e90507b27497
Content-Type: text/plain; charset=UTF-8

On Nov 12, 2014 5:40 PM, "Burton, Ross" <ross.burton@intel.com> wrote:
>
>
> On 12 November 2014 16:21, akuster808 <akuster808@gmail.com> wrote:
>>>
>>> Thanks for the ping, merged to mut.
>>

No problem. Hope to have it soon in dizzy

>>
>> What part did you take care of? Master or Dizzy?
>
>
> MUT feeds into master when Richard merges it.  You can backport from
master when it's there.
>
> Ross

--089e01419f9aeaa0e90507b27497
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">On Nov 12, 2014 5:40 PM, &quot;Burton, Ross&quot; &lt;<a hre=
f=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On 12 November 2014 16:21, akuster808 &lt;<a href=3D"mailto:akuster808=
@gmail.com">akuster808@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thanks for the ping, merged to mut.<br>
&gt;&gt;</p>
<p dir=3D"ltr">No problem. Hope to have it soon in dizzy </p>
<p dir=3D"ltr">&gt;&gt;<br>
&gt;&gt; What part did you take care of? Master or Dizzy?<br>
&gt;<br>
&gt;<br>
&gt; MUT feeds into master when Richard merges it.=C2=A0 You can backport f=
rom master when it&#39;s there.<br>
&gt;<br>
&gt; Ross=C2=A0</p>

--089e01419f9aeaa0e90507b27497--
